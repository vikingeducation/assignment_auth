class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login

  def sign_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def sign_out
    @current_user = nil
    session.delete(:user_id)
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
    # is it a problem that this doesn't throw an error?
  end
  helper_method :current_user

  def user_signed_in?
    !!current_user
  end
  helper_method :user_signed_in?

  def require_login
    unless user_signed_in?
      flash[:danger] = "Not authorized, please sign in!"
      redirect_to login_path
    end
  end
end
