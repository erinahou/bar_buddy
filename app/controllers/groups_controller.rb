class GroupsController < ApplicationController

  def new
    unless user_signed_in?
      flash.alert = 'You must be signed in to create an article'
      redirect_back_or_to({ action: 'index' })
    end
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)
    @group.creater_id = current_user.id
    if @group.save
      @group.members.create(user_id: current_user.id)

      redirect_to new_group_member_path(group_id: @group.id)
    else
      render :new
    end
  end

  def confirmation
    @group = Group.find(params[:id])
    @preselected_bars = @group.preselected_bars.includes(:votes)

    @member_votes_status = {}
    @group.members.each do |member|
      status = @group.votes_complete_for?(member.user) ? :complete : :pending
      @member_votes_status[member] = status
    end

    all_votes_complete = @member_votes_status.values.all?(:complete)

  if all_votes_complete
    # Call the verdict action
    verdict
    render :confirmation
  end

  end

  def verdict
    @group = Group.find(params[:id])
    @preselected_bars = @group.preselected_bars.includes(:votes)

    total_members = @group.members.count
    completed_votes = @preselected_bars.flat_map(&:votes).group_by(&:user_id)

    if completed_votes.length == total_members
      votes_count = Hash.new(0)
      @preselected_bars.each do |preselected_bar|
        preselected_bar.votes.each do |vote|
          votes_count[preselected_bar.bar_id] += vote.vote ? 1 : 0
        end
      end

      max_votes = votes_count.values.max
      winning_bars = votes_count.select { |_bar_id, count| count == max_votes }.keys

      @winning_bars = winning_bars.map { |bar_id| Bar.find(bar_id) }
      @winning_bar ||= @winning_bars.sample

      if @group.winning_bar_id.nil?
        if @winning_bar.present?
          @group.update(winning_bar_id: @winning_bar.id)
          @group.members.each do |member|
            UserMailer.verdict_email(member.user, @winning_bar, @group.date_of_outing, @group.time_of_outing).deliver_now
          end

          # flash[:notice] = 'Verdict and emails sent successfully!'
        else
          # flash.now[:alert] = 'No winning bar selected.'
        end
      else
        # flash.now[:alert] = 'The verdict has already been determined.'
      end
    else
      # flash.now[:alert] = 'Votes are not completed for all members yet.'
    end
  end
  private

  def group_params
    params.require(:group).permit(:title, :date_of_outing, :time_of_outing)
  end
end
