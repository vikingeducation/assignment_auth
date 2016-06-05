class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate

  USERS = { "john" => "1234" }

  private

  # authenticate with http digest

  def authenticate
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end

  # authenticate with http basic

  # def authenticate
  #   authenticate_or_request_with_http_basic do |username, password|
  #     USERS.keys.include?(username) && USERS[username] == password
  #   end
  # end
end
