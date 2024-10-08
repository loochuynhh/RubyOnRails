ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all
  include ApplicationHelper

  def is_logged_in?
    session[:user_id].present?
  end

  def log_in_as(user)
    session[:user_id] = user.id
  end
end

class ActionDispatch::IntegrationTest
  def log_in_as(user, password: 'password', remember_me: '1')
    params = {
      session: {
        email: user.email,
        password: password,
        remember_me: remember_me
      }
    }
    post login_path, params: params
  end
end
