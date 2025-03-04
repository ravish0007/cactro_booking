class EventOrganizerNotNullConstraint < ActiveRecord::Migration[8.0]
  def change
    change_column_null :event_organizers, :name, false 
    change_column_null :event_organizers, :phone, false
    change_column_null :event_organizers, :email, false
  end
end
