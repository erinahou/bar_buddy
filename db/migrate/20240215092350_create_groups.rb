class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :title
      t.date :date_of_outing
      t.time :time_of_outing
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :bar, null: false, foreign_key: { to_table: :bars }

      t.timestamps
    end
  end
end
