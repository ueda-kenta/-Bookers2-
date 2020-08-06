class BooksController < ApplicationController

	def new
		@book = Book.new
	end

	def create
		@user = current_user
		@book = Book.new(book_params)
		@books = Book.all
		@book.user_id = current_user.id
		if @book.save
		redirect_to book_path(book.id)
	    else
		render "users/show"
	    end
	end

	def index
		@books = Book.all
		@users = User.all
	end

	def show
		@book = Book.find(params[:id])
		@user = current_user
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		book = Book.find(params[:id])
		if book.update(book_params)
		redirect_to book_path(book)
	    else
	    render :edit
	    end
	end

	def destroy
		book = Book.find(params[:id])
		user = current_user
		book.destroy
		redirect_to user_path(user)
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
    end

end
