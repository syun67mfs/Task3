class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path(params[:id])
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :user_image, :introduction)
  end
end
