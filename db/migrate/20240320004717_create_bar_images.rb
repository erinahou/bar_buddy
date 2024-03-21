class CreateBarImages < ActiveRecord::Migration[7.0]
  def change
    create_table :bar_images do |t|
      t.references :bar, null: false, foreign_key: true
      t.string :image_url

      t.timestamps
    end
  end
end
