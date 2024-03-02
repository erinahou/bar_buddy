class AddUniqueIndexToPreselectedBars < ActiveRecord::Migration[7.0]
  def change
    add_index :preselected_bars, [:bar_id, :group_id], unique: true
  end
end
