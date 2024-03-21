class MemberEmailJob
  include Sidekiq::Worker

  def perform(current_user_id, user_id, group_id)
    current_user = User.find(current_user_id)
    user = User.find(user_id)
    group = Group.find(group_id)

    UserMailer.member_added_email(current_user, user, group).deliver_now
  end
end
