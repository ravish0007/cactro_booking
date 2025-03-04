class EventOrganizer < ApplicationRecord
  has_many :events
  validates :email, uniqueness: true
end
