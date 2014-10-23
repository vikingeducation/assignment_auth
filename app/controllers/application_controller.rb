class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login, :only => [:index, :show]

  def authenticate_user
    authenticate_or_request_with_http_basic('sample') do |username, password|
      username = 'admin' && password = 'password'
    end
  end

  private

  def sign_in(user)
    session[:user_id] = user.id
    @current_user = user
  end


  def sign_out
    @current_user = nil
    session.delete(:user_id)
  end

  def require_current_user
    unless params[:id] == current_user.id.to_s
      flash[:error] = "Unauthorized access, please try again"
      redirect_to root_url
  end

  def require_login
    unless signed_in_user?
      flash[:error] = "You aren't signed in, please try again"
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def signed_in_user?
    !!current_user
  end
  helper_method :signed_in_user?

end