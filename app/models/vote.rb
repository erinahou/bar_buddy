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

  def broadcast_button_update(group)
    all_votes_complete = group.members.all? { |member| group.votes_complete_for?(member.user) }
    Turbo::StreamsChannel.broadcast_replace_to "votes",
      target: "vote_action_buttons",
      partial: "groups/voting_button",
      locals: { all_votes_complete: all_votes_complete, group: group }
  end
end
