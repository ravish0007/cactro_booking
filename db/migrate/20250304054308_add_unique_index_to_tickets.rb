class AddUniqueIndexToTickets < ActiveRecord::Migration[8.0]
  def change
    add_index :tickets, [:type, :event_id], unique: true
  end
end
