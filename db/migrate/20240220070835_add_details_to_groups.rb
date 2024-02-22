class AddDetailsToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :when_do_you_want_to_go_out, :date
    add_column :groups, :which_area, :string
    add_column :groups, :time, :time
    add_column :groups, :invite_friends, :string
  end
end
