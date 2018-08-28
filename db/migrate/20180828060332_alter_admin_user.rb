class AlterAdminUser < ActiveRecord::Migration[5.2]
  def change
  	rename_column :admin_users, :hashed_password, :password_digest
  end
end
