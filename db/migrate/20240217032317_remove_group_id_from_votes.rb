class RemoveGroupIdFromVotes < ActiveRecord::Migration[7.0]
  def change
    remove_column :votes, :group_id
  end
end
