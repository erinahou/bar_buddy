class Bar < ApplicationRecord
  has_many :bar_characteristics
  has_many :characteristics, through: :bar_characteristics
  has_many :bar_images, dependent: :destroy
  geocoded_by :display_address
  after_validation :geocode, if: :will_save_change_to_display_address?
end
