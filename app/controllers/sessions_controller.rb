class SessionsController < ApplicationController
  def new
  end
  
  def create
  	admin = AdminUser.find_by(username: params[:session][:username].downcase)
    
  	if admin && admin.authenticate(params[:session][:password])
  		# Log the user in and redirect to the user's show page
      log_in admin
      redirect_to admin_home_path
  	else
  		render 'new'
  	end
  end
  
  def destroy
    log_out
    redirect_to admin_login_path
  end
end
