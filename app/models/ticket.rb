class Ticket < ApplicationRecord
  has_many :bookings
  has_one  :event
end
