class User < ActiveRecord::Base
  has_secure_password

  validates :password, :length => { minimum: 12 },
                       :allow_nil => true
end
