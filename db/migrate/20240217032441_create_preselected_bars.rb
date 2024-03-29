class CreatePreselectedBars < ActiveRecord::Migration[7.0]
  def change
    create_table :preselected_bars do |t|
        t.references :bar, null: false, foreign_key: true
        t.references :user, null: false, foreign_key: true
        t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
