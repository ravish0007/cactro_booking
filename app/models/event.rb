class Event < ApplicationRecord
  has_many :tickets
  belongs_to :event_organizer
  validates :name, presence: true
  validates :venue, presence: true
  validates :date, presence: true, timeliness: { type: :datetime }
end
