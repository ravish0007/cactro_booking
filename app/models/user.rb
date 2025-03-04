class User < ApplicationRecord
  has_many :bookings 
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true
end
