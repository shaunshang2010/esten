class AdminUser < ApplicationRecord
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	before_save { username.downcase! }
	
	validates :username, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 }
	validates :first_name, length: { maximum: 25 }
	
	has_secure_password
	
	# Returns the hash digest of the given string
	def AdminUser.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		
		BCrypt::Password.create(string, cost: cost)
	end
end
