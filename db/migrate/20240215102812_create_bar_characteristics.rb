class CreateBarCharacteristics < ActiveRecord::Migration[7.0]
  def change
    create_table :bar_characteristics do |t|
      t.references :characteristic, null: false, foreign_key: true
      t.references :bar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
