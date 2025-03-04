class EventOrganizer < ApplicationRecord
  has_many :events
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true
end
