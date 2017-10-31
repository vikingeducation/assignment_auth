class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :authenticate_user, :except => [:new, :index, :show ]
  
  # The HTTP Basic version (better)
  # http_basic_authenticate_with  :name => "foo",
  #                               :password => "bar",
  #                               :only => [:update, :create]

  private

  # The HTTP Basic version
  # def authenticate_user
  #   authenticate_or_request_with_http_basic('Checking credentials') do |username, password|
  #     username == "foo" && password == "bar"
  #   end
  # end

  USERS = { "user1" => "hellooooo", 
            "user2" => "pwd2" }
  
  # The HTTP Digest version (better)
  def authenticate_user
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end

end


