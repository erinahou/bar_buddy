class VotesController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    preselected_bars = @group.preselected_bars

    Rails.logger.info "Received parameters: #{params.inspect}"

    vote_params = JSON.parse(request.body.read)['votes']

    preselected_bars.each do |preselected_bar|
      vote_value = vote_params[preselected_bar.id.to_s]
      Rails.logger.info "Vote value for preselected_bar #{preselected_bar.id}: #{vote_value}"

      vote = Vote.new(
        user_id: current_user.id,
        preselected_bar_id: preselected_bar.id,
        vote: ActiveRecord::Type::Boolean.new.cast(vote_value)
      )

      unless vote.save
        flash[:alert] = "Failed to record votes."
        redirect_to @group
        return
      end
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
