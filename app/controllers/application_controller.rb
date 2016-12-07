class ApplicationController < ActionController::Base
  USERS = { "foo" => "bar" }

  protect_from_forgery with: :exception

  before_action :authenticate

  private

    def authenticate
      authenticate_or_request_with_http_digest do |username|
        USERS[username]
      end
    end
end
