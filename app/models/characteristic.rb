class Characteristic < ApplicationRecord
  has_many :bar_characteristics
  has_many :bars, through: :bar_characteristics
  has_and_belongs_to_many :groups
end
