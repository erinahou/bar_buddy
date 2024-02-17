class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :votes, dependent: :destroy
  has_many :groups, through: :members
  has_many :members, dependent: :destroy

  # validates :email, presence: true, uniqueness: true, format: { with: Devise.email_regexp }
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
  # validates :first_name, presence: true, length: { maximum: 255 }
  # validates :last_name, presence: true, length: { maximum: 255 }
end
