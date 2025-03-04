class User < ApplicationRecord

  has_secure_password

  has_many :bookings 
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true
end
