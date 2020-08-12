class BooksController < ApplicationController
	before_action :authenticate_user!

	def new
		@book = Book.new
	end

	def create
		@user = current_user
		@book = Book.new(book_params)
		@books = Book.all
		@book.user_id = current_user.id
		if @book.save
		flash[:success] = "successfully"
		redirect_to book_path(@book.id)
	    else
		render "users/show"
	    end
	end

	def index
		@books = Book.all
		# @user = @books.user
		@users = User.all
	end

	def show
		@book = Book.find(params[:id])
		@user = User.find(@book.user_id)
	end

	def edit
		@book = Book.find(params[:id])
		if @book.user == current_user
			render "edit"
		else
			redirect_to books_path
		end
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:success] = "successfully"
		redirect_to book_path(@book.id)
	    else
	    render "books/edit"
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
		params.require(:book).permit(:title, :body,:user_id)
    end

   def user_params
   	    params.require(:user).permit(:name, :introduction, :profile_image_id)
   end

end
