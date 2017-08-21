class ApplicationController < ActionController::Base
  USERS = {"hags" => "carl62"}
  protect_from_forgery with: :exception
  before_action :authenticate_user, :except => [:new, :index, :create]

  private
  def authenticate_user
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end
end
