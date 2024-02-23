class MembersController < ApplicationController
  before_action :set_group, only: [:new, :create]

  def new
    @member = Member.new
  end

  def create
    # Extract the email parameter from the form submission
    email = params[:email]
    # Perform a SQL query to find the user with the matching email
    user = User.find_by(email: email)
    if user
      # If a user with the matching email is found, create a new member record
      Member.create(user_id: user.id, group_id: params[:group_id])
      redirect_to root_path, notice: 'Member added successfully!'
    else
      # If no user with the matching email is found, handle the error accordingly
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
