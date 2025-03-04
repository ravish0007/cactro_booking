class AddBookingToUsers < ActiveRecord::Migration[8.0]
  def change
    add_reference :bookings, :user, null: false, foreign_key: true
  end
end
