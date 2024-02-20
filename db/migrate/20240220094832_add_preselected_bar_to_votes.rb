class AddPreselectedBarToVotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :votes, :preselected_bar, null: false, foreign_key: true
  end
end
