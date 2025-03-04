class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :venue
      t.datetime :date

      t.timestamps
    end
  end
end
