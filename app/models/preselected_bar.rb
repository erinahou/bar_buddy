class PreselectedBar < ApplicationRecord
  validates :bar_id, uniqueness: { scope: :group_id }

  belongs_to :group
  belongs_to :bar
  has_many :votes
end
