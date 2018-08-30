require 'test_helper'

class AdminUsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @admin_user = admin_users(:michael)
  end
  
  test "login with invalid information" do
    get admin_login_path
    assert_template 'sessions/new'
    post admin_login_path, params: { session: { username: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  
  test "login with valid information followed by logout" do
    get admin_login_path
    post admin_login_path, params: { session: { username: @admin_user.username,
                                                password: 'password' } }
    assert is_logged_in?
    assert_redirected_to admin_home_path
    follow_redirect!
    delete admin_logout_path
    assert_not is_logged_in?
    assert_redirected_to root_path
    follow_redirect!
  end
end
