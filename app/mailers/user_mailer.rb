class UserMailer < ApplicationMailer
  def member_added_email(inviting_user, user, group)
    @inviting_user = inviting_user
    @user = user
    @group = group
    @date_of_outing = @group.date_of_outing.try(:strftime, "%A, %d %B %Y") || @group.date_of_outing
    @time_of_outing = @group.time_of_outing.try(:strftime, "%I:%M %p") || @group.time_of_outing

    # Generating the URL for the preselected bars page
    @preselected_bars_url = group_preselected_bars_url(@group)

    mail(to: @user.email, subject: "#{@inviting_user.first_name} has invited you to the #{@group.title} group on Bar Buddy")
  end

  def verdict_email(user, winning_bar, date_of_outing, time_of_outing, group_id)
    @user = user
    @winning_bar = winning_bar
    @date_of_outing = date_of_outing.strftime("%A, %d %B %Y")
    @time_of_outing = time_of_outing.strftime("%I:%M %p")

    @verdict_page_url = verdict_group_url(group_id)

    mail(to: @user.email, subject: "Winning Bar Announcement")
  end
end
