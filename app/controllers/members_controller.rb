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
      @group = Group.find(group_id)
      member = Member.find_by(user_id: user.id, group_id: group_id)

      if member
        # redirect_to new_group_member_path(group_id: group_id), alert: 'Member already exists in the group.'
        render json: { status: "exists", user: user }, status: :created
      else
        Member.create(user_id: user.id, group_id: group_id)
        # redirect_to new_group_member_path(group_id: group_id), notice: 'Member added successfully!'
        render json: { status: "success", user: user }, status: :created
        UserMailer.member_added_email(current_user, user, @group).deliver_now
      end
    else
      flash.now[:alert] = "No user found..."
      render json: { status: "No users", user: user }, status: :created
      # render :new, status: :unprocessable_entity
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
