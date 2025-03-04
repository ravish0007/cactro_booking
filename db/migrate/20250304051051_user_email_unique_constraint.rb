class UserEmailUniqueConstraint < ActiveRecord::Migration[8.0]
  def change
    add_index :users, [:email], unique: true, name: 'uniq_email_per_user'
  end
end
