class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate
  CREDENTIALS = { "foo" => "bar" }

  private
    def authenticate
      authenticate_or_request_with_http_digest do |un|
        CREDENTIALS[un]
      end
    end
end
