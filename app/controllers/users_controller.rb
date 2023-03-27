class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @book1 = Book.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "successfully"
    redirect_to user_path(@user.id)
  end

  def index
    @users = User.all
    @user = User.new
    @user = current_user
    @book = Book.new
  end

   private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
