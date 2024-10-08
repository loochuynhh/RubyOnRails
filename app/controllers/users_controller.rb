class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :following, :followers]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.activated.paginate(page: params[:page], per_page: Settings.defaults.users_per_page)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = 'Please check your email to activate your account.'
      redirect_to root_path
    else
      flash.now[:error] = 'There was an error creating your account. Please check the form and try again.'
      render_err('new')
    end
  end

  def new
    @user = User.new
  end

  def show
    redirect_to(root_url, flash: {warning: 'This account is not activated.'}) unless @user.activated?
    @microposts = @user.microposts.paginate(page: params[:page], per_page: Settings.defaults.users_per_page)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      flash.now[:error] = 'There were errors updating your profile'
      render_err('edit')
    end
  end

  def destroy
    if @user
      @user.destroy
      flash[:success] = 'User deleted'
    else
      flash[:error] = 'User not found'
    end
    redirect_to users_url
  end

  def following
    @title = 'Following'
    @users = @user.following.paginate(page: params[:page], per_page: Settings.defaults.users_per_page)
    render 'show_follow'
  end

  def followers
    @title = 'Followers'
    @users = @user.followers.paginate(page: params[:page], per_page: Settings.defaults.users_per_page)
    render 'show_follow'
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
    if @user.nil?
      flash[:error] = 'User not found'
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = 'Please log in.'
    redirect_to login_url
  end

  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
