class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # http_basic_authenticate_with  :name => "foo", 
  #                               :password => "bar",
  #                               :only => [:update, :create]

  USERS = { "foo" => "bar" }

  before_action :authenticate, only:[:update, :create]

  private

    def authenticate
      authenticate_or_request_with_http_digest do |username|
        USERS[username]
      end
    end
end

