class Group < ApplicationRecord
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

end
