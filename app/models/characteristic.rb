class Characteristic < ApplicationRecord
  has_many :bar_characteristics
  has_many :bars, through: :bar_characteristics
end
