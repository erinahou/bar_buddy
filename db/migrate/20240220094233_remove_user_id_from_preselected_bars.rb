class RemoveUserIdFromPreselectedBars < ActiveRecord::Migration[7.0]
  def change
    remove_column :preselected_bars, :user_id
  end
end
