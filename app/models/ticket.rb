class Ticket < ApplicationRecord
  self.inheritance_column= nil    # due to column name type
  has_many :bookings
  belongs_to  :event
  validates :type, uniqueness: { scope: :event_id, message: "should be unique per event" }, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :availability, presence: true
  validates :remaining, presence: true
  validates :remaining, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: :availability }
  validates :availability, numericality: { greater_than_or_equal_to: 0 }
end

