class CreateAccessTickets < ActiveRecord::Migration
  def change
    create_table :access_tickets do |t|
      t.references :user, index: true, null: false
      t.string :authentication_token
      t.datetime :expired_at
      t.integer :available_times

      t.timestamps null: false
    end
    add_foreign_key :access_tickets, :users
  end
end
