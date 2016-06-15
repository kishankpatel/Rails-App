class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		
		@psw = params[:password]
		@conf_psw = params[:confirm_password]
		

		if @user.save
			flash[:saved_msg] = "You have registered Successfully..."
			redirect_to '/login'
		else
			# p @user.errors 
			# @user.errors.each do |m|
			# 	puts "111111111111111111111111111"
				#p m.messag
            # end
			# flash[:saved_err_msg] = "Something went wrong...!!!"
			render 'new'
		end
	end
	def edit
	    @user = User.find(params[:id])
	end 
	def update
		@user = User.find(params[:id])
 
	    if @user.update(user_params)
	      redirect_to '/listing'
	    else
	      render 'edit'
	    end
	end
	def destroy
	    @user = User.find(params[:id])
	    @user.destroy
	 
	    redirect_to "/listing"
	  end
	private
		def user_params
			params.require(:user).permit(:name, :email, :username, :password, :age, :phoneno, :address)
		end
end
