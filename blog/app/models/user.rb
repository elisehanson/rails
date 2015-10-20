

class User < ActiveRecord::Base

	has_secure_password

def self.authenticate(email, password)
end

	has_many :posts
	
end