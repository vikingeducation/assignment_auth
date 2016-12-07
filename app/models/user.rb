class User < ApplicationRecord
  has_secure_password

  private

    def user_params
      params.require(:user).permit(:password)
    end
end
