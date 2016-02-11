class ApplicationController < ActionController::Base
  USERS = { 'foo' => 'bar'}
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end
  helper_method :current_user

  def sign_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def sign_out
    @current_user = nil
    session[:user_id] = nil
  end

  def authenticate
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end

  def authorize
    unless current_user && current_user.id.to_s == params[:id]
      redirect_to root_url, alert: "Not Authorized!"
    end
  end
end
