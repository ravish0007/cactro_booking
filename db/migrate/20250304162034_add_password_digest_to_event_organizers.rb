class AddPasswordDigestToEventOrganizers < ActiveRecord::Migration[8.0]
  def change
    add_column :event_organizers, :password_digest, :string
  end
end
