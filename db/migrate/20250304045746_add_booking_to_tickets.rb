class AddBookingToTickets < ActiveRecord::Migration[8.0]
  def change
    add_reference :bookings, :ticket, null: false, foreign_key: true
  end
end
