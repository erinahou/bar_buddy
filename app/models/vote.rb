class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :bar
  belongs_to :group
end
