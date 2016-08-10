class ApplicationController < ActionController::Base
  USERS = { "foo" => "bar" }

  protect_from_forgery with: :exception

  # http_basic_authenticate_with :name => "foo",
  #                              :password => "bar",
  #                              :except => [:index, :show]

  private

    def sign_in(user)
      session[:user_id] = user.id
      @current_user = user
    end

    # reverse the sign in...
    def sign_out
      @current_user = nil
      session.delete(:user_id)
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    # Will turn the current_user into a boolean
    # e.g. `nil` becomes false and anything else true.
    def signed_in_user?
      !!current_user
    end
    helper_method :signed_in_user?
end
