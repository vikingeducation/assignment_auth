class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login

  def login(user)
    session[:user_id] = user.id
    @current_user = user
  end
  helper_method :login

  def logout
    @current_user = nil
    session.delete(:user_id)
  end
  helper_method :logout

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def logged_in_user?
    !!current_user
  end
  helper_method :logged_in_user?

  private

  def require_login
    unless logged_in_user?
      flash[:error] = "You do not have permission to access this page. Please log in."
      redirect_to login_path
    end
  end
end
