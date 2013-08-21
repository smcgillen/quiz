class AddUsersTable < ActiveRecord::Migration
  def change
      create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.text :location
      t.float :longitude, :default => 0
      t.float :latitude, :default => 0
      t.timestamps
    end
  end
end

