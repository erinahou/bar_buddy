class RenameUserAndBarInGroups < ActiveRecord::Migration[7.0]
  def change
    rename_column :groups, :user_id, :creater_id
    rename_column :groups, :bar_id, :verdict_bar_id
  end
end
