class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :signed_in_user?
  helper_method :current_user
  before_action :require_login
  # http_basic_authenticate_with :name => "username", 
  #                              :password => "password",
  #                              :only => [:update, :create]

  def sign_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def sign_out
    @current_user = nil
    session.delete(:user_id)
  end

  def signed_in_user?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless signed_in_user?
      flash[:error] = "Not authorized, please sign in !"
      redirect_to login_path
    end
  end

  def require_account_owner
    unless params[:id] == current_user.id.to_s
      flash[:error] = "You aren't authorized to perform this action."
      redirect_to root_path
    end
  end
end
