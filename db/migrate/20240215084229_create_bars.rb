class CreateBars < ActiveRecord::Migration[7.0]
  def change
    create_table :bars do |t|
      t.string :name
      t.text :address
      t.text :description
      t.string :rating
      t.jsonb :hours

      t.timestamps
    end
  end
end
