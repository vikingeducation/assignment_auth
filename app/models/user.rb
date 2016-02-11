class User < ActiveRecord::Base
  has_secure_password

  validates :password,
            :length => {:in => 2..10 },
            :allow_nil => true

end
