class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  validates :password, length: { in: 6..30 }, allow_nil: true
end
