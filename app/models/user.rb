class User < ActiveRecord::Base
	has_secure_password
	validates :email, :password, presence: true
end
