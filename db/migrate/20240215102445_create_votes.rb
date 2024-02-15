class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bar, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.boolean :vote

      t.timestamps
    end
  end
end
