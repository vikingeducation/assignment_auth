class User < ActiveRecord::Base
  has_secure_password

  validates :password, length: {in: 8..24}, allow_nil: true
  validates :username, :email, :presence => true, :uniqueness => true
end
