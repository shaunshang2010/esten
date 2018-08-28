class AddIndexToAdminUsersUsername < ActiveRecord::Migration[5.2]
  def change
  	add_index :admin_users, :username, unique: true
  end
end
