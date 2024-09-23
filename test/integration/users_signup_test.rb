require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'invalid signup information' do
    get signup_path

    signup_params = {
      user: {
        name: '',
        email: 'user@invalid',
        password: 'foo',
        password_confirmation: 'bar'
      }
    }
    assert_no_difference 'User.count' do
      post users_path, params: signup_params
    end

    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test 'valid signup information' do
    get signup_path

    signup_params = {
      user: {
        name: 'Example User',
        email: 'user@example.com',
        password: 'password',
        password_confirmation: 'password'
      }
    }
    assert_difference 'User.count', 1 do
      post users_path, params: signup_params
    end

    follow_redirect!
    # assert_template 'users/show'
    # assert_predicate self, :is_logged_in?
  end
end
