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
      redirect_to root_path, notice: 'Member added successfully!'
    else
      render :new, notice: 'No user found with that email.'
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
