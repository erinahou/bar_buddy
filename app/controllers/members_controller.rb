class MembersController < ApplicationController
  before_action :set_group, only: [:new, :create]

  def new
    @member = Member.new
  end

  def create
    email = params[:email]
    user = User.find_by(email: email)
    group_id = params[:group_id]
    if user
      if user.id == current_user.id
        redirect_to new_group_member_path(group_id: group_id), alert: 'You cannot add yourself to the group.'
        return
      end
      @group = Group.find(group_id)
      member = Member.find_by(user_id: user.id, group_id: group_id)
      if member
        redirect_to new_group_member_path(group_id: group_id), alert: 'Member already exists in the group.'
      else
        Member.create(user_id: user.id, group_id: group_id)
        redirect_to new_group_member_path(group_id: group_id), notice: 'Member added successfully!'
      end
    else
      flash.now[:alert] = "No user found..."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def members_params
    params.require(:member).permit(:email)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
