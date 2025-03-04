class CreateTickets < ActiveRecord::Migration[8.0]
  def change
    create_table :tickets do |t|
      t.decimal :price
      t.string :type
      t.integer :availability

      t.timestamps
    end
  end
end
