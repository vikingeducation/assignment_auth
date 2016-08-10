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
  helper_method :current_user



  
  # http_basic_authenticate_with  name: "Leo",
  #                               password: "password",
  #                               only: [:update, :edit, :destroy]

  # before_action :authenticate, only: [:update, :edit, :destroy]
  # USERS = { "Leo" => "password"}
  #
  #
  # def authenticate
  #   authenticate_or_request_with_http_digest do |username|
  #     USERS[username]
  #   end
  # end
end
