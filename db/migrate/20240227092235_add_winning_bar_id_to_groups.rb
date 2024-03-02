class AddWinningBarIdToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :winning_bar_id, :integer
  end
end
