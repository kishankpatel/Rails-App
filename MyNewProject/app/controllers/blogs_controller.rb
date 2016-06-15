class BlogsController < ApplicationController
	before_action :check_account, only: [:dashboard]
	def listing
        @users = User.all.order("id desc")
    end

	
	def dashboard
        # @blog = Blog.new
        @blogs = Blog.all.order("id desc")
    end
    # def blog_list
        
    # end
    def new_blog
        @current_user = session[:user_id]
        @blog = Blog.new
    end
    def edit_blog
        
    end
    def save_blog
        @blog = Blog.new(blog_params)
        @blog.save
        redirect_to "/dashboard"
    end
    def delete_blog
        @blog = Blog.find_by_id(params[:id])
        @blog.destroy
        @blogs = Blog.all.order("id desc")
        redirect_to "/dashboard"
    end
    def show_blog
        @blog = Blog.find(params[:id])
        session[:blog_id] = params[:id]
        p @blog

        p "///////////////"
        # @users = @blog.user_id

        @current_user = User.find(session[:user_id])
        p @current_user.id
        @comment = Comment.new
        @comments = @blog.comments.order("id desc")
    end
    def save_comment
        @comment = Comment.new(params_comment)
        @comment.blog_id = session[:blog_id]
        @comment.user_id = session[:user_id]
        @comment.save
        redirect_to "/dashboard"
    end
    def public_blog
        @public_blogs = PublicBlog.all.order("id desc")
    end
    def new_public_blog
        @blog = Blog.new(blog_params)
        @blog.save
        redirect_to "/dashboard"
    end
    def show_public_blog
        @public_blog = PublicBlog.find(params[:id])
        p '///////////////////'
        p @public_blog
        session[:public_blog_id] = params[:id]
        p '------------------'
        p session[:public_blog_id]
        # @current_user = User.find(session[:user_id])
        # p @current_user.id
        @comment = Comment.new

        @comments = @public_blog.comments.order("id desc")
        p "^^^^^^^^^^^^^"
        p @comments
    end
    def save_public_comment
        @comment = Comment.new(params_comment)
        @comment.public_blog_id = session[:public_blog_id]
        @comment.user_id = session[:user_id]
        @comment.save
        redirect_to "/public_blog"
    end


    
    private

    def params_comment
        params.require(:comment).permit(:comment)
    end
    def blog_params
        params.require(:blog).permit(:user_id,:blog_name,:blog_description)
    end
    def check_account
    	unless session[:user]
    		flash[:error] = "Please login first...!!!"
    		redirect_to "/login"
    	end
    end
end
