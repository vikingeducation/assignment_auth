class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # http_basic_authenticate_with  name: "Leo",
  #                               password: "password",
  #                               only: [:update, :edit, :destroy]

  before_action :authenticate, only: [:update, :edit, :destroy]
  USERS = { "Leo" => "password"}


  def authenticate
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end
end
