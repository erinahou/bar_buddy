class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.creater_id = current_user.id
    if @group.save
      redirect_to root_path, notice: 'Group created successfully!'
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:title, :date_of_outing, :time_of_outing)
  end
end
