class User < ApplicationRecord
  has_many :bookings 
  validates :email, uniqueness: true
end
