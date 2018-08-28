class AdminUser < ApplicationRecord
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	before_save { username.downcase! }
	
	validates :username, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :first_name, length: { maximum: 25 }
	
	# has_secure_password
end
