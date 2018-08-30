class AdminUsersController < ApplicationController
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
			log_in @admin
      redirect_to 'index'
    else
      render 'new'
    end
	end
	
	private
	
		def user_params
			params.require(:admin_user).permit(:username, :first_name, :last_name, :password, :password_confirmation)
		end
end
