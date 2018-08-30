require 'test_helper'

class AdminUsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'AdminUser.count' do
      post admin_users_path, params: { admin_user: { username: "user@invalid",
                                               first_name: "",
                                               last_name: "",
                                               password: "foo",
                                               password_confirmation: "bar" } }
    end
    assert_template 'admin_users/new'
  end
  
  test "valid signup information" do
    get signup_path
    assert_difference 'AdminUser.count', 1 do
      post admin_users_path, params: { admin_user: { username: "first_last@example.com",
                                                     first_name: "First",
                                                     last_name: "Last",
                                                     password: "password",
                                                     password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'admin_users/index'
    assert is_logged_in?
  end
end