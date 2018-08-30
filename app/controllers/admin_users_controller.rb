class AdminUsersController < ApplicationController
	# before_action :logged_in_user
	
	def index
		@admins = AdminUser.all
	end
	
	def show
		@admin = AdminUser.find(params[:id])
	end
	
	def new
		@admin = AdminUser.new
	end
	
	def create
		@admin = AdminUser.new(user_params)
		
		if @admin.save
			flash[:success] = "Welcome!"
			log_in @admin
			redirect_to admin_home_path
    else
      render 'new'
    end
	end
	
	private
	
		def user_params
			params.require(:admin_user).permit(:username, :first_name, :last_name, :password, :password_confirmation)
		end
		
		# Confirms a logged-in-user.
		# def logged_in_user
		# 	puts "---------"
		# 	unless logged_in?
		# 		redirect_to admin_login_path
		# 	end
		# end
end
