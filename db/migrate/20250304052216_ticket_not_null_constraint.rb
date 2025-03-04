class TicketNotNullConstraint < ActiveRecord::Migration[8.0]
  def change
    change_column_null :tickets, :price, false  # Change `users` and `name` to your table and column
    change_column_null :tickets, :availability, false  # Change `users` and `name` to your table and column
    change_column_null :tickets, :type, false  # Change `users` and `name` to your table and column
  end
end
