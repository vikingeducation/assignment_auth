class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :require_login
=begin this comment was for basic authentications
  http_basic_authenticate_with  :name => "foo", 
                              :password => "bar",
                              :only => [:update, :create]
=end
=begin this comment was for digest authentication
  before_action :authenticate_user
  
  USERS = { "foo" => "bar" }
  
  private
  def authenticate_user
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end
=end


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

  # Will turn the current_user into a boolean
  # e.g. `nil` becomes false and anything else true.
  def signed_in_user?
    !!current_user
  end
  helper_method :signed_in_user?
  
  def require_login
    unless signed_in_user?
      flash[:error] = "You are not supposed to do this without signed in"
      redirect_to login_path
    end
  end

  def require_current_user

    unless params[:id] == current_user.id.to_s
      flash[:error] = "You're not authorized to view this."
      redirect_to root_url
    end
  end

end
