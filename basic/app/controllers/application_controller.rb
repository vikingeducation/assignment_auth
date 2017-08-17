class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user
  USERS = {"carl" => "cup"}

  private
  def authenticate_user
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end

end
