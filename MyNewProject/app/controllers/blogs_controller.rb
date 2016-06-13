class BlogsController < ApplicationController
	before_action :check_account, only: [:dashboard]
	def listing
        @users = User.all.order("id desc")
    end

	def check_user
        p params
        if (user = User.where(:username => params[:username], :password => params[:password]).first).present?
            session[:user] = user.username
            session[:user_id] = user.id
            redirect_to "/dashboard"
        else
        	p 'else......................'
            flash[:invalid_user_msg] = "Invalid user or password..!! Please try again..."
            #redirect_to "/login"
            redirect_to "/login"
        end
	end
	def dashboard
        # @blog = Blog.new
        @blogs = Bolg.all.order("id desc")
    end
    def blog_list
        
    end
    def delete_blog
        @blog = Bolg.find_by_id(params[:id])
        @blog.destroy
        @blogs = Bolg.all.order("id desc")
    end
    def login
    		
    end
    def display
        @blog = Book.find(params[:id])
        render :partial => "display"
    end
    def logout
    	#session(:user).delete
    	session[:user] = nil
    	session[:user_id] = nil
    	flash[:notice] = "You have successfully logged out...!!!"
    	redirect_to "/login"
    end
    private

    def check_account
    	unless session[:user]
    		flash[:error] = "Please login first...!!!"
    		redirect_to "/login"
    	end
    end
end
