class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # USERS  =  {"foo" => "password"}

  # before_action :authenticate

  http_basic_authenticate_with :name => "foo",
                                :password => "password",
                                :only => [:index, :show]


  private

  def authenticate
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end

end
