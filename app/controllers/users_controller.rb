class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def create
    @user = User.new(params[:id])
    if @user.save
      flash[:notice] = "successfully"
     redirect_to user_path
    else
      render :new
    end
  end

  def edit
  	@user = User.find(params[:id])
    @book = Book.find(params[:id])
  end


 def update
  @user = User.find(params[:id])
  if @user.update(user_params)
  redirect_to user_path
  else
    render
  end
 end

  private
   def user_params
     params.require(:user).permit(:name, :introduction, :profile_image)
   end
   def book_params
     params.require(:book).permit(:name, :body, :user_id)
   end
end