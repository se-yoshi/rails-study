class CreateUserAttributes < ActiveRecord::Migration
  def change
    create_table :user_attributes do |t|
      t.references :user, null: false
      t.string :username

      t.timestamps null: false
    end
    add_foreign_key :user_attributes, :users
    add_index :user_attributes, :user_id, unique: true
  end
end
