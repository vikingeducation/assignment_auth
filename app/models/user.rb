class User < ActiveRecord::Base
  has_secure_password

  validates :password, 
            :length => { :in => 5..25 }, 
            :allow_nil => true
end
