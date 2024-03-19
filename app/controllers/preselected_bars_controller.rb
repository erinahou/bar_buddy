class PreselectedBarsController < ApplicationController
  before_action :set_group, :set_characteristics

  def index
    @preselected_bars = @group.preselected_bars
  end

  def new
    @preselected_bar = PreselectedBar.new
  end

  def create
    selected_characteristic_styles = params[:preselected_bar][:characteristic_ids]
    selected_bars = Bar.joins(:bar_characteristics).joins(:characteristics).where(characteristics: { style: selected_characteristic_styles })

    selected_bars.each do |bar|
      unless PreselectedBar.exists?(bar_id: bar.id, group_id: @group.id)
        PreselectedBar.create(bar_id: bar.id, group_id: @group.id)
      end
    end

    redirect_to group_preselected_bars_path(@group)
  end

  private

  def set_characteristics
    @characteristics = ['pub', 'cocktail', 'wine bar', 'dive bar', 'with food', 'brewery', 'rooftop bar', 'kid friendly', 'dog friendly', 'speakeasy', 'distillery']
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
