class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :preselected_bar
  after_commit :broadcast_vote_status, on: [:create, :update]

  def broadcast_vote_status
    group = self.preselected_bar.group # Assuming `preselected_bar` belongs_to :group
    user = self.user
    status = group.votes_complete_for?(user) ? :complete : :pending

    Turbo::StreamsChannel.broadcast_replace_to "votes",
      target: "vote_status_#{user.id}",
      partial: "groups/vote_status",
      locals: { user: user, status: status }

      Turbo::StreamsChannel.broadcast_replace_to "group_show",
      target: "vote_status_#{user.id}",
      partial: "groups/vote_status",
      locals: { user: user, status: status }

  end
end
