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
        render json: { status: "exists", message: 'Member already exists in the group.', user: user }, status: :unprocessable_entity
      else
        new_member = Member.create(user_id: user.id, group_id: group_id)
        UserMailer.member_added_email(current_user, user, @group).deliver_now if new_member.persisted?
        render json: { status: "success", message: 'Member added successfully!', user: user }, status: :created
      end
    else
      render json: { status: "no_user", message: "No user found...", user: user }, status: :not_found
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
