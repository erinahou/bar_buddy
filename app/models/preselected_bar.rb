class PreselectedBar < ApplicationRecord
  belongs_to :group
  belongs_to :bar
  has_many :votes
end
