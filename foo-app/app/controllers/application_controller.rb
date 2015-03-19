class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def sign_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def signed_in_user?
    !!current_user
  end
  helper_method :signed_in_user?
end
