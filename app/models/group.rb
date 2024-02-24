class Group < ApplicationRecord
  belongs_to :creater, class_name: 'User', foreign_key: 'creater_id'
  has_many :members, dependent: :destroy
  has_many :users, through: :members
  has_many :preselected_bars

  validates :title, presence: true
  validates :date_of_outing, presence: true
  validates :time_of_outing, presence: true

end
