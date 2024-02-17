class RemoveVerdictBarIdFromGroups < ActiveRecord::Migration[7.0]
  def change
    remove_column :groups, :verdict_bar_id
  end
end
