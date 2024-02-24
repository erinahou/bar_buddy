class Group < ApplicationRecord
  belongs_to :creater, class_name: 'User', foreign_key: 'creater_id'
  has_many :members, dependent: :destroy
  has_many :users, through: :members
  has_many :preselected_bars

  # validates :which_area, presence: true
  # validates :time, presence: true
  # validates :invite_friends, presence: true

end
