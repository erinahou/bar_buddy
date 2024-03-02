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
        redirect_to @group
        return
      end
    end

    redirect_to confirmation_group_path(@group), notice: "Votes recorded successfully."
  end
end
