class ApplicationController < ActionController::Base
  # USERS = { "foo" => "bar" }

  protect_from_forgery with: :exception

  before_action :authenticate_user
  # before_action :authenticate

  private

    # def authenticate
    #   authenticate_or_request_with_http_digest do |username|
    #     USERS[username]
    #   end
    # end

    def authenticate_user
      redirect_to login_path unless logged_in_user?
    end

    def log_in(user)
      session[:user_id] = user.id
      @current_user = user
    end

    def log_out
      @current_user = nil
      session.delete :user_id
    end

    def current_user
      @current_user ||= User.find( session[:user_id] ) if session[:user_id]
    end

    def logged_in_user?
      !!current_user
    end
end
