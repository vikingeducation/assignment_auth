class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login

  private

  # Store the current user in an instance variable so we don't
  # have to make repeated calls to our database when this method
  # is used many times.
  # If we haven't set the instance variable, set that variable
  # using the user_id in our session.
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def require_current_user
    # don't forget that params is a string!!!
    unless params[:id] == current_user.id.to_s
      flash[:error] = "You're not authorized to view this"
      redirect_to users_path
    end
  end

  # call our other friendly helper, 'signed_in_user?'
  def require_login
    unless signed_in_user?
      flash[:error] = "Not authorized, please sign in!"
      redirect_to login_path
    end
  end

  # Simply store our ID in the session
  # and set the current user instance var
  def sign_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  # Will turn the current_user into a boolean
  # e.g. 'nil' becomes false and anything else but true.
  def signed_in_user?
    !!current_user
  end
  helper_method :signed_in_user?

  # reverse the sign in...
  def sign_out
    @current_user = nil
    session.delete(:user_id)
  end
end
