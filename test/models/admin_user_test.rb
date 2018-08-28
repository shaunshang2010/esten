require 'test_helper'

class AdminUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
  	@admin = AdminUser.new(username: "test@hotmail.com", first_name: "Test", last_name: "User")
  end
  
  test "should be valid" do
  	assert @admin.valid?
  end
  
  test "username should be present" do
  	@admin.username = ''
  	assert_not @admin.valid?
  end
  
  test "first name should not be too long" do
  	@admin.first_name = "a" * 26
  	assert_not @admin.valid?
  end
  
  test "username validation should accept valid addresses" do
  	valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
  	
  	valid_addresses.each do |valid_address|
  		@admin.username = valid_address
  		assert @admin.valid?, "#{valid_address.inspect} should be valid"
  	end
  end
  
  test "username validation should reject invalid addresses" do
  	invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
  	
  	invalid_addresses.each do |invalid_address|
  		@admin.username = invalid_address
  		assert_not @admin.valid?, "#{invalid_address.inspect} should be invalid"
  	end
  end
  
  test "username should be unique" do
  	duplicate_admin = @admin.dup
  	duplicate_admin.username = @admin.username.upcase
  	@admin.save
  	assert_not duplicate_admin.valid?
  end
  
  # test "username should be saved as lower-case" do
  # 	mixed_case_username = "Foo@ExAMPle.CoM"
  # 	@admin.email = mixed_case_username
  # 	@admin.save
  	
  # 	assert_equal mixed_case_username.downcase, @admin.reload.username
  # end
end
