class BooksController < ApplicationController
	def save
		@book = Book.new(book_params)
		if @book.save
			p '----------------------------'
			p params
			p '-----------------------------'
			p @book.privacy
			@books = Book.all.order("id desc")
			#flash[:saved_msg] = "! book saved Successfully..."
			# redirect_to '/'
			#render :text => "book saved Successfully..."
			#render :partial => "listing"
		else
			render :partial => "form"
		end
	end

	def index
		@book = Book.new
		@books = Book.paginate(:page => params[:page], :per_page => 3)
	end
	def listing
		#@books = Book.all.order("id desc")
	end

	def delete_book
		p '///////////////////////////////'
		@book = Book.find_by_id(params[:id])
	    @book.destroy
	    @books = Book.all.order("id desc")
	end
	def edit
	    @book = Book.find(params[:id])
	    #@books = Book.all.order("id desc")
	end 
	def update
		@book = Book.find(params[:id])
 	    if @book.update(book_params)
	      redirect_to '/index'

	    else
	      render 'edit'
	    end
	end
	def show
		@book = Book.find(params[:id])
		#@books = Book.all.order("id desc")
		render :partial => "show"
	end
	private
	def book_params
			params.require(:book).permit(:name, :title, :author, :privacy)
	end
end
