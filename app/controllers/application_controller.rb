class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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

  def signed_in_user?
    !!current_user
  end

  helper_method :current_user, :signed_in_user?

end
