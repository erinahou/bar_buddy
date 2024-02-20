class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :preselected_bar
end
