class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # http_basic_authenticate_with  :name => "tester",
  #                               :password => "owls15",
  #                               :only => [:index, :show]

  USERS = {"tester2" => "frogs"}

  before_action :authenticate, :only => [:index, :show]

  def authenticate
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end
end
