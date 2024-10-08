require 'test_helper'

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:archer)
  end

  test 'micropost interface' do
    log_in_as(@user)

    get root_path
    assert_select 'div.pagination'
    assert_select 'input[type="submit"]'

    assert_no_difference 'Micropost.count' do
      post microposts_path, params: {micropost: {content: ''}}
    end

    assert_select 'div#error_explanation'
    assert_select 'a[href=?]', '/?page=2'

    content = 'This micropost really ties the room together'
    image = fixture_file_upload('test/fixtures/kitten.jpg', 'image/jpeg')
    assert_difference 'Micropost.count', 1 do
      post microposts_path, params: {micropost: {content: content, image: image}}
    end

    assert_predicate assigns(:micropost).image, :attached?
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body

    assert_select 'a', text: 'delete'
    first_micropost = @user.microposts.paginate(page: 1).first

    assert_difference 'Micropost.count', -1 do
      delete micropost_path(first_micropost)
    end

    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: Settings.defaults.users_per_page
  end
end
