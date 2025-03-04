class EventOrganizer < ApplicationRecord
  has_many :events
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true
  validates :phone, presence: true

end
