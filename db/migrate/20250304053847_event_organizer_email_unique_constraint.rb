class EventOrganizerEmailUniqueConstraint < ActiveRecord::Migration[8.0]
  def change
    add_index :event_organizers, [:email], unique: true, name: 'uniq_email_per_event_organizer'
  end
end
