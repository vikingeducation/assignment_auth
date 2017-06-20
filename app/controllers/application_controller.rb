class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # http_basic_authenticate_with  :name => "tester",
  #                               :password => "owls15",
  #                               :only => [:index, :show]

  # USERS = {"tester2" => "frogs"}

  # before_action :authenticate, :only => [:index, :show]

  # def authenticate
  #   authenticate_or_request_with_http_digest do |username|
  #     USERS[username]
  #   end
  # end

  private
  def sign_in(user)
    session[:user] = user.id
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

  def signed_in_user?
    !!current_user
  end
  helper_method :signed_in_user?

end
