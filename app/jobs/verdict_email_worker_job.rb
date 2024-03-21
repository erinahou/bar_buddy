class VerdictEmailWorkerJob
  include Sidekiq::Worker

  def perform(user_id, winning_bar_id, group_id)
    user = User.find(user_id)
    winning_bar = Bar.find(winning_bar_id)
    UserMailer.verdict_email(user, winning_bar, group_id).deliver_now
  end
end
