class AlterAdminUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :admin_users, :password, false
  	change_column_default :admin_users, :password, ''
  end
end
