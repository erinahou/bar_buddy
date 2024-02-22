class CreateCharacteristicsGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :characteristics_groups do |t|
      t.belongs_to :group
      t.belongs_to :characteristic
      t.timestamps
    end
  end
end
