class GroupsController < ApplicationController
  def new
    @group = Group.new
    @characteristics = Characteristic.all
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      selected_bars = Bar.joins(:bar_characteristics).where(bar_characteristics: { characteristic_id: params[:group][:characteristic_ids] })
      selected_bars.each do |bar|
        unless PreselectedBar.exists?(bar_id: bar.id, group_id: @group.id)
          PreselectedBar.create(bar_id: bar.id, group_id: @group.id)
        end
      end
      redirect_to groups_path, notice: 'Group created successfully!'
    else
      render :new
    end
  end

  def index
    @groups = Group.all
  end

  def yes
  end

  def no
  end

  def confirm
  end

  def verdict
  end

  def destroy_member
  end

  def add_member
  end

  private

  def group_params
    params.require(:group).permit(:title, :date_of_outing, :time_of_outing)
  end
end
