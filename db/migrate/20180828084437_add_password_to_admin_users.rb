class AddPasswordToAdminUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :admin_users, :password, :string
  end
end
