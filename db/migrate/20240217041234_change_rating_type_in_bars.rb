class ChangeRatingTypeInBars < ActiveRecord::Migration[7.0]
  def change
    change_column :bars, :rating, 'float USING CAST(rating AS float)'
  end
end
