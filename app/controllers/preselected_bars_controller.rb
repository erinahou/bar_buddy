class PreselectedBarsController < ApplicationController
  before_action :set_group

  def index
    @preselected_bars = @group.preselected_bars
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end
end
