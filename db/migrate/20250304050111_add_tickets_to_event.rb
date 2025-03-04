class AddTicketsToEvent < ActiveRecord::Migration[8.0]
  def change
    add_reference :tickets, :event, null: false, foreign_key: true
  end
end
