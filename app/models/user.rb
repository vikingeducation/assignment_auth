class User < ActiveRecord::Base
  has_secure_password

  validates :password, length: { in: 3..64 },
                       allow_nil: true
end
