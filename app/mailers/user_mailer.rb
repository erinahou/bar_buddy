class UserMailer < ApplicationMailer
  def member_added_email(inviting_user, user, group)
    @inviting_user = inviting_user
    @user = user
    @group = group
    @date_of_outing = @group.date_of_outing.try(:strftime, "%A, %d %B %Y") || @group.date_of_outing
    @time_of_outing = @group.time_of_outing.try(:strftime, "%I:%M %p") || @group.time_of_outing
    mail(to: @user.email, subject: "#{@inviting_user.first_name} has invited you to the #{@group.title} group on Bar Buddy")
  end

  def verdict_email(user, winning_bar, date_of_outing, time_of_outing)
    @user = user
    @winning_bar = winning_bar
    @date_of_outing = date_of_outing.strftime("%A, %d %B %Y")
    @time_of_outing = time_of_outing.strftime("%I:%M %p")
    mail(to: @user.email, subject: "The Nominated Bar Is...")
  end
end

