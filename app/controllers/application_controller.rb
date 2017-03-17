class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # HTTP Basic Auth 
  # http_basic_authenticate_with  :name => "foo", 
  #                             :password => "bar",
  #                              :only => [:update, :create]

  # for http digest auth
  # in reality, use env var to store this
  # USERS = { "foo" => "bard" }
  # before_action :authenticate
  
  #  def authenticate
  #    authenticate_or_request_with_http_digest do |username|
  #      USERS[username]
  #    end
  #  end

  # session-based auth
  private

  def sign_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def sign_out
    @current_user = nil
    session.delete[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def signed_in_user?
    !!current_user
  end
  helper_method :signed_in_user?

  def require_current_user
    unless params[:id] == current_user.id.to_s
      flash[:error] = "not authorized"
      redirect_to root_url
    end
  end
end
