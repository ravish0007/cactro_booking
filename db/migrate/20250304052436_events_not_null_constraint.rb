class EventsNotNullConstraint < ActiveRecord::Migration[8.0]
  def change
    change_column_null :events, :name, false
    change_column_null :events, :venue, false
    change_column_null :events, :date, false
  end
end
