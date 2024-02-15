class Group < ApplicationRecord
  belongs_to :creater, class_name: 'User', foreign_key: 'creater_id'
  belongs_to :verdict_bar, class_name: 'Bar', foreign_key: 'verdict_bar_id'
end
