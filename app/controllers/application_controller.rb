class ApplicationController < ActionController::Base
  USERS = { "foo" => "bar" }

  protect_from_forgery with: :exception

  # http_basic_authenticate_with :name => "foo",
  #                              :password => "bar",
  #                              :except => [:index, :show]


  before_action :authenticate

  private

  def authenticate

    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end

end
