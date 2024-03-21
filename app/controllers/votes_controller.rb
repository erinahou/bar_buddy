class VotesController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    preselected_bars = @group.preselected_bars

    preselected_bars.each do |preselected_bar|
      vote = Vote.new(
        user_id: current_user.id,
        preselected_bar_id: preselected_bar.id,
        vote: params["vote_#{preselected_bar.id}"] == "true"
      )

      unless vote.save
        flash[:alert] = "Failed to record votes."
        all_votes_saved = false
        redirect_to @group
        return
      end
    end

    if all_members_voted?(@group)
      Turbo::StreamsChannel.broadcast_replace_to "votes",
        target: "voting_button",
        partial: "groups/voting_button",
        locals: { group: @group }
    end

    redirect_to confirmation_group_path(@group)
  end

  private

  def all_members_voted?(group)
    group.preselected_bars.all? do |bar|
      bar.votes.where(user: group.members.map(&:user)).count == group.members.count
    end
  end
end
