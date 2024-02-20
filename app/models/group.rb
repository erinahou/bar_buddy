class Group < ApplicationRecord
  belongs_to :creater, class_name: 'User', foreign_key: 'creater_id'
  has_many :members, dependent: :destroy
  has_many :users, through: :members
end
