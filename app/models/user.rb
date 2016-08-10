class User < ActiveRecord::Base
  has_secure_password

  validates :password, 
            :length => {:minimum => 8, :maximum => 24}, 
            :allow_nil => true
end
