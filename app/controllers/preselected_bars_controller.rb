class PreselectedBarsController < ApplicationController
  def index
    @preselected_bars = Preselected_bars.all
  end
end
