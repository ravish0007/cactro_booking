class Ticket < ApplicationRecord
  has_many :bookings
  belongs_to  :event
  validates :type, uniqueness: { scope: :event_id, message: "should be unique per event" }, presence: true
  validates :price, presence: true
  validates :availability, presence: true
  validates :remaining, presence: true
end

