class AddLoginNameToUsers < ActiveRecord::Migration
  def up
    add_column :users, :login_name, :string, null: false
    add_index :users, :login_name, unique: true
    remove_column :users, :email, :string, null: false, default: ""
  end

  def down
    remove_column :users, :login_name, :string, null: false
    add_column :users, :email, :string, null: false, default: ""
    add_index :users, :email, unique: true
  end
end
