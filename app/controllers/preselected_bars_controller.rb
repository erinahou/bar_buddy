class PreselectedBarsController < ApplicationController
  def index
    @preselected_bars = PreselectedBar.all;
  end
end
