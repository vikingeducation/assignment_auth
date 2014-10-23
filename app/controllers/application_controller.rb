class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #  http_basic_authenticate_with :name => "admin",
  #                             :password=> "schmadmin",
  #                            :except => [:index,:show]

  private
  # Simply store our ID in the session
  # and set the current user instance var

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

    def signed_in_user?
      !!current_user
    end
    helper_method :signed_in_user?

    def require_current
      unless current_user && params[:id] == current_user.id.to_s
        redirect_to users_path
      end
    end

end
