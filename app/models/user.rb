class User < ActiveRecord::Base
	validates :username, 
						:presence => {:message => "must be present"},
						:uniqueness => true
  validates :password, presence: {:message => "must be present"}
  
  has_secure_password
end


