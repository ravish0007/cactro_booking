class Event < ApplicationRecord
  has_many :tickets
  has_one :event_organizer
end
