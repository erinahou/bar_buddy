class Group < ApplicationRecord
  belongs_to :creater, class_name: 'User', foreign_key: 'creater_id'
  belongs_to :verdict_bar, class_name: 'Bar', foreign_key: 'verdict_bar_id'
  has_many :members, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :users, through: :members

  has_and_belongs_to_many :characteristics

  accepts_nested_attributes_for :characteristics

  # Ensure the column names match your actual database columns
  validates :when_do_you_want_to_go_out, presence: true
  validates :which_area, presence: true
  validates :time, presence: true
  validates :invite_friends, presence: true
end
