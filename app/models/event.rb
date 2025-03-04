class Event < ApplicationRecord
  has_many :tickets
  belongs_to :event_organizer
end
