class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # http_basic_authenticate_with :name => "foo",
  #                              :password => "bar",
  #                              :except =>[:show, :index]

  # USERS = {"foo" => "bar"}

  # before_action :authenticate

  # private

  #   def authenticate
  #     authenticate_or_request_with_http_digest do |username|
  #       USERS[username]
  #     end
  #   end

  def sign_in(user)
    session[:current_user_id] = user.id
    current_user = user
  end

  def sign_out
    session.delete(:current_user_id)
    current_user = nil
    session[:current_user_id].nil? && current_user.nil?
  end

  def current_user
    return nil unless session[:current_user_id]
    @current_user ||= User.find(session[:current_user_id])
  end
  helper_method :current_user

  def current_user=(user)
    @current_user = user
  end

  def signed_in_user?
    !!current_user
  end
  helper_method :signed_in_user?

  private
  def require_login
    unless signed_in_user?
      flash[:error] = "Not authorized, please sign in!"
      redirect_to login_path
    end
  end
end
