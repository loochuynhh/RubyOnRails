require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test 'should get new' do
    get signup_path
    assert_response :success
  end

  test 'should show user if exists' do
    user_params = {
      name: 'Example User',
      email: 'user@example.com',
      password: 'password',
      password_confirmation: 'password'
    }
    user = User.create!(user_params)
    get user_path(user)
    assert_response :success
    assert_select 'h1', user.name
  end

  test 'should redirect to root and show flash message if user not found' do
    get user_path(-1)
    assert_redirected_to root_path
    assert_not flash[:error].empty?
    assert_equal 'User not found', flash[:error]
  end

  test 'should redirect edit when not logged in' do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect update when not logged in' do
    update_params = {
      user: {
        name: @user.name,
        email: @user.email
      }
    }
    patch user_path(@user), params: update_params
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect edit when logged in as wrong user' do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert_predicate flash, :empty?
    assert_redirected_to root_url
  end

  test 'should redirect update when logged in as wrong user' do
    log_in_as(@other_user)
    user_params = {
      user: {
        name: @user.name,
        email: @user.email
      }
    }
    patch user_path(@user), params: user_params
    assert_predicate flash, :empty?
    assert_redirected_to root_url
  end

  test 'should redirect index when not logged in' do
    get users_path
    assert_redirected_to login_url
  end

  test 'should not allow the admin attribute to be edited via the web' do
    log_in_as(@other_user)
    assert_not @other_user.admin?

    user_params = {
      user: {
        password: 'password',
        password_confirmation: 'password',
        admin: true
      }
    }
    patch user_path(@other_user), params: user_params
    assert_not @other_user.reload.admin?
  end

  test 'should redirect destroy when not logged in' do
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy when logged in as a non-admin' do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to root_url
  end
end
