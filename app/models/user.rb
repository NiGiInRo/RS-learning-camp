class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :targets
  has_many :matches
  validates :name, :lastname, :email, :password,  presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  devise :database_authenticatable, :jwt_authenticatable, :registerable, jwt_revocation_strategy: JwtDenylist
end
