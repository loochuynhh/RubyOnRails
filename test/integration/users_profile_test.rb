require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
  end

  test 'profile display' do
    get user_path(@user)
    assert_template 'users/show'

    assert_select 'title', full_title(@user.name)

    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'

    assert_match @user.microposts.count.to_s, response.body

    @user.microposts.each do |micropost|
      assert_select 'a[href=?]', user_path(@user), text: @user.name
      assert_select 'span.content', text: micropost.content
    end

    if @user.microposts.count > Settings.defaults.users_per_page
      assert_select 'div.pagination'
      assert_select 'a', text: 'Next'
    end
  end
end
