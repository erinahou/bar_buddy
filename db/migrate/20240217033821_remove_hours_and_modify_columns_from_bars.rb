class RemoveHoursAndModifyColumnsFromBars < ActiveRecord::Migration[7.0]
  def change
    remove_column :bars, :hours, :jsonb
    rename_column :bars, :address, :display_address
    add_column :bars, :image_url, :string
  end
end
