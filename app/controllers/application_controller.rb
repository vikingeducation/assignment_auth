class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # HTTP Basic Auth 
  # http_basic_authenticate_with  :name => "foo", 
  #                             :password => "bar",
  #                              :only => [:update, :create]

  # for http digest auth
  # in reality, use env var to store this
  # USERS = { "foo" => "bard" }
  # before_action :authenticate
  
  #  def authenticate
  #    authenticate_or_request_with_http_digest do |username|
  #      USERS[username]
  #    end
  #  end
end
