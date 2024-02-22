class GroupsController < ApplicationController
  def new
    @group = Group.new
    @characteristics = ['pub', 'cocktail', 'wine bar', 'dive bar', 'with food', 'brewery', 'rooftop bar', 'kid friendly', 'dog friendly', 'speakeasy', 'distillery'].map do |name|
      characteristic = Characteristic.find_by(name: name)

      if characteristic.nil?
        characteristic = Characteristic.create(name: name)
      end

      characteristic
    end
  end

  def create
    @group = current_user.groups.build(group_params)
    @characteristics = Characteristic.find(params[:group][:characteristic_ids].reject(&:empty?))

    @group.characteristics = @characteristics

    if @group.save
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

  def group_params
    params.require(:group).permit(:title, :when_do_you_want_to_go_out, :which_area, :time, :invite_friends, characteristic_ids: [])
  end
end
