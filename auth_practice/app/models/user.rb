class User < ActiveRecord::Base
  has_secure_password
  validates :password,
            :length => {:in => 1..5},
            :allow_nil => true
end
