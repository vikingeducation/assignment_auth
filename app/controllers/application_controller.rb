class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # http_basic_authenticate_with :name => "blorg", :password => "grolb", :only => [:index, :show]

  # before_action :call_cookie
  #
  # def call_cookie
  #   p cookies
  #   p session
  # end

  USERS = { "glorb" => "glorb"}

  before_action :authenticate

  private

    def authenticate
      authenticate_or_request_with_http_digest do |username|
        USERS[username]
      end
    end


end
