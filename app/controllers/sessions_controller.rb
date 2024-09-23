class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)

    unless @user&.authenticate(params[:session][:password])
      flash.now[:danger] = 'Invalid email/password combination'
      return render_err('new')
    end

    return activate_user if @user.activated?

    flash[:warning] = 'Account not activated. Check your email for the activation link.'
    redirect_to root_url
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def activate_user
    log_in(@user)
    params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
    redirect_back_or @user
  end
end
