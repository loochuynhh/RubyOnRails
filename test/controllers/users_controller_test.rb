require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
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
end
