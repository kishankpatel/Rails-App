class OrdersController < ApplicationController
	
	def new
		@user_order = User_Order.new
	end
	def show
		# @user = user.where :id =>session.user_id
		puts "!!!!!!!!!!!!!!!!!!!!!!"
		p session[:user_id]
		@user = User.find(session[:user_id])
		p @user
		 @orders = @user.orders#.show(order_params)
	end
	private
	    def order_params
	    	p params
	      params.require(:order).permit(:order_name, :user_id)
	    end
end
