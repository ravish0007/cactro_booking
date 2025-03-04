class AddRemainingToTickets < ActiveRecord::Migration[8.0]
  def change
    add_column :tickets, :remaining, :integer, null: false
  end
end 
