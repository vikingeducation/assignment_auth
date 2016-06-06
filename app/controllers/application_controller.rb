class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login

  private

  def sign_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def sign_out
    @current_user = nil
    session.delete(:user_id)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def sign_in_user?
    !!current_user
  end
  helper_method :sign_in_user?

  def require_login
    unless sign_in_user?
      flash[:danger] = "You cannot do this if you're not log in"
      redirect_to users_path
    end
  end

  def require_current_user
    unless params[:id] == current_user.id.to_s
      flash[:danger] = "You cannot do this unless your the user concerned"
      redirect_to users_path
    end
  end

end


  # before_action :authenticate

  # USERS = { "john" => "1234" }

  # private

  # # authenticate with http digest

  # def authenticate
  #   authenticate_or_request_with_http_digest do |username|
  #     USERS[username]
  #   end
  # end

  # # authenticate with http basic

  # # def authenticate
  # #   authenticate_or_request_with_http_basic do |username, password|
  # #     USERS.keys.include?(username) && USERS[username] == password
  # #   end
  # # end