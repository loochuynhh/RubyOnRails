require 'test_helper'

class LayoutLinksTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test 'layout links for non-logged-in users' do
    get root_path
    assert_template 'static_pages/home'

    assert_select 'a[href=?]', root_path
    assert_select 'a[href=?]', help_path
    assert_select 'a[href=?]', login_path
    assert_select 'a[href=?]', signup_path
    assert_select 'a[href=?]', user_path(@user), count: 0
    assert_select 'a[href=?]', logout_path, count: 0
  end

  test 'layout links for logged-in users' do
    log_in_as(@user)
    get root_path
    assert_template 'static_pages/home'

    assert_select 'a[href=?]', root_path
    assert_select 'a[href=?]', help_path
    assert_select 'a[href=?]', user_path(@user)
    assert_select 'a[href=?]', logout_path
    assert_select 'a[href=?]', login_path, count: 0
    assert_select 'a[href=?]', signup_path, count: 0
    assert_select 'a[href=?]', edit_user_path(@user)
  end
end
