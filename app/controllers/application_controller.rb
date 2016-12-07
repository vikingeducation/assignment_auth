class ApplicationController < ActionController::Base
  before_action :authenticate, :except => [:index, :show]
  protect_from_forgery with: :exception
  USERS = { 'user' => 'password' }

  private
    def authenticate
      authenticate_or_request_with_http_digest do |username|
        USERS[username]
      end
    end
end
