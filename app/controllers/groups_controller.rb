class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.creater_id = current_user.id
  end

  def create
    @group = Group.new(group_params)
    @group.creater_id = current_user.id

    if @group.save
      redirect_to new_group_member_path(@group), notice: 'Group created successfully!'
    else
      render :new
    end
  end

  def confirmation
    @group = Group.find(params[:id])
    @preselected_bars = @group.preselected_bars.includes(:votes)

    total_preselected_bars = @preselected_bars.count
    @member_votes_status = {}

    @group.members.each do |member|
      member_votes = member.user.votes.where(preselected_bar_id: @preselected_bars.pluck(:id)).distinct.count

      if member_votes == total_preselected_bars
        @member_votes_status[member] = "Votes Complete"
      else
        @member_votes_status[member] = "Votes Pending"
      end
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
        else
          flash.now[:alert] = 'No winning bar selected.'
        end
      else
        flash.now[:alert] = 'The verdict has already been determined.'
      end
    else
      flash.now[:alert] = 'Votes are not completed for all members yet.'
    end
  end

  private

  def group_params
    params.require(:group).permit(:title, :date_of_outing, :time_of_outing)
  end
end
