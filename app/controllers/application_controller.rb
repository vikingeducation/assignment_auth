class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id])
  end
  helper_method :current_user

  def sign_in(user)
    @current_user = user
    session[:user_id] = user
  end

  def sign_out
    @current_user = nil
    session.delete :user_id
  end
end
