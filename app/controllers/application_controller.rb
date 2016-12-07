class ApplicationController < ActionController::Base
  before_action :authenticate, :except => [:index, :show]
  protect_from_forgery with: :exception

  private
    def whitelisted_user_params
      params.require(:user).permit(:username,
                                   :email,
                                   :password, :password_confirmation)
    end

    def sign_in
      session[:user_id] = user.id
      @current_user = user
    end

    def sign_out
      @current_user = nil
      session.delete(:user_id)
    end

    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def signed_in_user?
      !!current_user
    end
    helper_method :signed_in_user?
    
end
