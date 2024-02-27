class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @active_groups = Group.where("date_of_outing >= ?", Date.today)
    @past_groups = Group.where("date_of_outing < ?", Date.today)
  end
end
