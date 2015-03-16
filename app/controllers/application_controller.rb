class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  USERS = { "schwad" => "packerphan10"}

  before_action :authenticate
  protect_from_forgery with: :exception


private

  def authenticate
    authenticate_or_request_with_http_digest  do |username|
      USERS[username]
    end
  end
end
