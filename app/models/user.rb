class User < ApplicationRecord
  has_secure_password

  validates :username, :email,
            presence: true

  validates :password,
            length: { in: 8..40 },
            allow_nil: true

end
