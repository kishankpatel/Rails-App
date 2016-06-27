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
			session[:name] = user.name
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
	def student_details
		# @student = Student.new
		@students = Student.all.order("id desc")
	end
	def add_student
		@student = Student.new
		@subjects = Subject.all.order("id desc")
		@standard_subjects = StandardSubject.all.order("id desc")
		p @standard_subjects
	end
	def create_student
		@student = Student.new(student_params)
		@student.user_id = session[:user_id]
		@student.subjects = params[:subjects]
		@student.save
		redirect_to "/student_details"
	end
	def delete_student
		@student = Student.find_by_id(params[:id])
		@student.destroy
		redirect_to "/student_details"
	end
	def edit_student
		@student = Student.find_by_id(params[:id])
	end
	def show_student_details
		@student = Student.find_by_id(params[:id])
	end
	def standard_details
		@standard = Standard.new
		@standards = Standard.all.order("id desc")
	end
	def create_standard
		@standard = Standard.new(standard_params)
		@standard.save
		redirect_to "/standard_details"
	end
	def delete_standard
		@standard = Standard.find_by_id(params[:id])
		p params[:id]
		p '..................................'
		p @standard
		@standard.destroy
		@standards = Standard.all.order("id desc")
		redirect_to "/standard_details"
	end
	def edit_standard
		@standard = Standard.find_by_id(params[:id])
	end
	def update_standard
		@standard = Standard.find_by_id(params[:id])
		if @standard.update(standard_params)
	      redirect_to '/standard_details'
	    else
	      render 'edit_standard'
	    end
	end
	def subject_details
		@subject = Subject.new	
		@subjects = Subject.all.order("id desc")
	end
	def create_subject
		@subject = Subject.new(subject_params)
		@subject.save
		redirect_to "/subject_details"
	end
	def delete_subject
		session[:subject_id] = params[:id]
		@subject = Subject.find_by_id(params[:id])
		@subject.destroy
		redirect_to "/subject_details"
	end
	def edit_subject
		p session[:subject_id]
		p "//////////"
		@subject = Subject.find_by_id(session[:subject_id])
		@subjects = Subject.all.order("id desc")
	end

	def list_subjects
		p "--------kkkkkkkkkkkkk--------"
		@standard = Standard.find_by_id(params[:id])
		@subjects = @standard.subjects
		p "--------------------------"
		p @subjects
		p "------------------------"
		render :partial => "get_subjects"
	end
	
	def assign_subject
		@standard_subjects = StandardSubject.new
	end
	def save_assign_subject
		@standard_subjects = StandardSubject.new(standard_subjects_params)
		@standard_subjects.save
		redirect_to "/assign_subject"
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
    def standard_params
    	params.require(:standard).permit(:name)
    end
    def subject_params
    	params.require(:subject).permit(:name)
    end
    def standard_subjects_params
    	params.require(:standard_subject).permit(:standard_id, :subject_id)
    end
    # def check_login
    # 	if session[:user_name]
    # 		redirect_to("/dashboard")and return
    # 	end
    # end
end
