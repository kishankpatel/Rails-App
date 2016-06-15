class HomeController < ApplicationController
	#http_basic_authenticate_with name: "kishan", password: "patel"
	before_action :check_account, only: [:dashboard]
	def index
	end
	def calculate_result
		@num1 = params[:number1].to_f
		@num2 = params[:number2].to_f
		@addition = @num1 + @num2
		@sub = @num1 - @num2
		@mul = @num1 * @num2
		@div = @num1 / @num2
		
		#render :text => "Kisan..hi"
		#flash[:notice] = "hey..you cannot access this page"
		#redirect_to root_path
	end
    def test_sanitize
        
    end
    def script_inject
        
    end
    def sanitise
        # full_sanitizer = Rails::Html::FullSanitizer.new
        # @val = full_sanitizer.sanitize(params[:name])
        # --------------------------
        # tags = ["h1","input"]
        # attributes = ["href"]
        # @val = ActionController::Base.helpers.sanitize(params[:name], tags: tags, attributes: attributes)
        # render :text => @val
        #----------------------------
        #---------------------------------in text area
        # render :text => params[:name]
        # <script type="text/javascript">
        # alert('stop talking')
        # </script>
        #-----------------------------------
        #----------------------------------
         # @txt = params[:name]
        UserMailer.welcome('cute.sarojini20@gmail.com','Sarojini',params[:message]).deliver
        render :text => "Message sent successfully...."
    end
    def listing
        @users = User.all.order("id desc")
    end

	def check_user

		p User.count
		p  '=============================='
        p params
        if (user = User.where(:username => params[:username], :password => params[:password]).first).present?
        # params[:username] = "1) OR 1=1--"
        # User.all(:conditions => ['title = ?', params[:username]])
        # User.all(:conditions => ["username = ?", params[:username]])
        # @user = params[:username]

       # these codes injects so don't use these code 

        #1. params[:username] = "' or '1'='1"
        #1.if( user = User.where("username = '#{params[:username]}'").first)

        #1. if( user = User.where("username = '#{params[:username]}'","password = #{params[:password]}").first)
        #2. username =   'or '1'='1    &   password =    'or '1'='1
        #2. kishan' or password = 'abc 

        # if (user = User.where("username LIKE '%#{params[:username]}%'"))

            p 'success'
            #flash[:notice] = "Authenticated....."
            # flash[:notice] = "Please login first...!!!"
            #storre session here
            ##logout button 
            session[:user] = user.username
            session[:user_id] = user.id
            redirect_to "/dashboard"
            #redirect_to 
        else
        	p 'else......................'
            flash[:invalid_user_msg] = "Invalid user or password..!! Please try again..."
            #redirect_to "/login"
            redirect_to "/login"
        end
	end
	def dashboard
        # @blog = Blog.new
        @blogs = Blog.all.order("id desc")
    end
    def write_mail
        @comment = Comment.new
        @user = User.find(params[:id])
    end
    def send_mail
        @comment = Comment.new
        @user = User.find(params[:id])
        UserMailer.welcome(@user.email,@user.name,params[:message]).deliver
        flash[:notice] = "Message sent successfully..."
        redirect_to "/listing"
    end
    def blog_list
        @blogs = Blog.all.order("id desc")
    end
    def delete_blog
        @blog = Blog.find_by_id(params[:id])
        @blog.destroy
        @blogs = Blog.all.order("id desc")
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
