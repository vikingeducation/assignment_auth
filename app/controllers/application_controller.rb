class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user, :except => [:new, :index]



  USERS = { "foo" => "bar" }


  # http_basic_authenticate_with  :name => "foo",
  #                               :password => "bar",
  #                               :only => [:update, :create]
  private
  # The HTTP Digest version (better)
  # def authenticate_user
  #   authenticate_or_request_with_http_digest do |username|
  #     USERS[username]
  #   end
  # end

  # The HTTP Basic version
  def authenticate_user
    authenticate_or_request_with_http_basic('Checking credentials') do |username, password|
      username == "foo" && password == "bar"
    end
  end
end


