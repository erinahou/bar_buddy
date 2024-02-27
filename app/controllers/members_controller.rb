class MembersController < ApplicationController
  before_action :set_group, only: [:new, :create]

  def new
    @member = Member.new
  end

  def create
    email = params[:email]
    user = User.find_by(email: email)
    if user
      Member.create(user_id: user.id, group_id: params[:group_id])
      flash[:notice] = 'Member added successfully!'
    else
      render :new
      flash.now[:alert] = 'No user found with that email.'
    end

    unless @group.members.exists?(user_id: current_user.id)
      Member.create(user_id: current_user.id, group_id: @group.id)
    end

    redirect_to new_group_member_path(group_id: params[:group_id])
  end

  private

  def members_params
    params.require(:member).permit(:email)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
