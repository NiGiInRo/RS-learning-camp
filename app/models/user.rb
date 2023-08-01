class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :targets, dependent: :destroy
  has_many :matches, dependent: :destroy
  has_many :conversations, dependent: :destroy
  validates :name, :lastname, :email, :password,  presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  devise :database_authenticatable, :jwt_authenticatable, :registerable, jwt_revocation_strategy: JwtDenylist
end
