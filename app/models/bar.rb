class Bar < ApplicationRecord
  has_many :bar_characteristics
  has_many :characteristics, through: :bar_characteristics
end
