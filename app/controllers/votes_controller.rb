class VotesController < ApplicationController

  def create
    @group = Group.find(params[:group_id])
    preselected_bars = @group.preselected_bars

    preselected_bars.each do |preselected_bar|
      vote = Vote.new(
        user_id: current_user.id,
        group_id: @group.id,
        bar_id: preselected_bar.bar_id,
        vote: params["vote_#{preselected_bar.id}"] == "true"
      )

      vote.save
    end

    redirect_to @group, notice: "Votes recorded successfully."
  end
end
