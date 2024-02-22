class RemoveBarIdFromVotes < ActiveRecord::Migration[7.0]
  def change
    remove_column :votes, :bar_id
  end
end
