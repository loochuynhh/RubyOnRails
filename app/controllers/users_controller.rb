class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Welcome to the Sample App!'
      redirect_to @user
    else
      flash[:error] = 'There was an error creating your account. Please check the form and try again.'
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
