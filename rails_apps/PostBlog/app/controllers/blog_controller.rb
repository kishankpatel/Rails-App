class BlogController < ApplicationController
	before_action :check_account, only: [:dashboard]
	before_action :check_login, only: [:home, :login]


	def dashboard
		
	end
	def create
		@user = User.new(user_params)
		if(@user.save)
			flash[:registered_successfully] = "Registered successfully..."
			redirect_to "/login"
		else
			render 'new'
		end
	end
	def logout
		session[:user_name] = ""
		session[:user_id] = ""
		redirect_to "/login"
	end
	private
	def user_params
		params.require(:user).permit(:name, :user_name, :password, :age, :email, :phone_no, :address)
	# :user --> user.rb that is model name
	end
	def check_account
    	unless session[:user_name]
    		flash[:error] = "Please login first...!!!"
    		redirect_to "/login"
    	end
    end
    def check_login
    	if session[:user_name]
    		redirect_to "/dashboard"
    	end
    end
end
