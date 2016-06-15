class UserController < ApplicationController
	before_action :check_account, only: [:dashboard]
	# before_action :check_login, only: [:home, :login]
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
		# render 'login'
	end

	def add_student
		@student = Student.new
	end
	def add_teacher
		@teacher = Teacher.new
	end
	def add_class
		@standard = Standard.new
	end
	def add_subject
		@subject = Subject.new
	end


	def create_student
		@student = Student.new(student_params)
		@student.user_id = session[:user_id]
		@student.save
		redirect_to "/dashboard"
	end

	def list_student
		
	end
	def list_teacher
		
	end
	def list_class
		
	end
	def list_subject
		
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
    def student_params
    	params.require(:student).permit(:name, :roll, :standard, :subjects, :age, :gender, :mobile, :email, :address )
    end
    # def check_login
    # 	if session[:user_name]
    # 		redirect_to("/dashboard")and return
    # 	end
    # end
end
