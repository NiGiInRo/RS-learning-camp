class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, :lastname, :email, :password,  presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
