class UserController < ApplicationController
	def home
		
	end
	def login
		
	end
	def validate_user
		if (user = User.where(:user_name => params[:user_name], :password => params[:password]).first).present?
			session[:user_name] = user.user_name
			session[:user_id] = user.id
			redirect_to "/dashboard"
		else
			flash[:error] = "login failed...!!!  Try again"
			render 'login'
		end
	end
	def new
		@user = User.new
	end
end
