class Group < ApplicationRecord
  after_update_commit :broadcast_winning_bar_update, if: :saved_change_to_winning_bar_id?
  belongs_to :creater, class_name: 'User', foreign_key: 'creater_id'
  belongs_to :winning_bar, class_name: "Bar", foreign_key: "winning_bar_id", optional: true
  has_many :members, dependent: :destroy
  has_many :users, through: :members
  has_many :preselected_bars

  validates :title, presence: true
  validates :date_of_outing, presence: true
  validates :time_of_outing, presence: true

  def votes_complete_for?(user)
    total_preselected_bars = self.preselected_bars.count
    member_votes_count = user.votes.where(preselected_bar_id: self.preselected_bars.pluck(:id)).distinct.count
    member_votes_count == total_preselected_bars
  end

  def broadcast_winning_bar_update
    Turbo::StreamsChannel.broadcast_replace_to "active_groups",
      target: "group_#{id}",
      partial: "groups/group_card",
      locals: { group: self }

    Turbo::StreamsChannel.broadcast_replace_to "past_groups",
      target: "group_#{id}",
      partial: "groups/group_card",
      locals: { group: self }

    Turbo::StreamsChannel.broadcast_replace_to "verdict",
      target: "verdict_#{id}",
      partial: "groups/verdict",
      locals: { group: self }

    Turbo::StreamsChannel.broadcast_replace_to "confirmation",
      target: "confirmation_#{id}",
      partial: "groups/voting_button",
      locals: { group: self }
  end
end
