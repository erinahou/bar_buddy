class AddNameToCharacteristics < ActiveRecord::Migration[7.0]
  def change
    add_column :characteristics, :name, :string
  end
end
