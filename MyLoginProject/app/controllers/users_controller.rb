class UsersController < ApplicationController
	def login
		
	end
	def check_user
		p "----------------------------------------"
		p params
        if (user = User.where(:username => params[:username], :password => params[:password]).first).present?
            session[:user] = user.username
            session[:user_id] = user.id
            redirect_to "/dashboard"

        else
        	p 'else......................'
            flash[:invalid_user_msg] = "Invalid user or password..!! Please try again..."
            redirect_to "/login"
        end
	end
end
