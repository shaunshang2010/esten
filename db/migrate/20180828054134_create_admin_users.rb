class CreateAdminUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_users do |t|
    	t.string :username, :default => '', :null => false
    	t.string :hashed_password
    	t.string :first_name, :limit => 25
    	t.string :last_name, :limit => 50
    	
      t.timestamps
    end
  end
end
