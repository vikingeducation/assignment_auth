class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  USERS = { 'user' => 'password'}

  # before_action :authenticate_basic, except: [:show, :index]
  before_action :authenticate_digest, except: [:show, :index]


  private

  def authenticate_basic
    authenticate_or_request_with_http_basic do |u, pass|
      u == 'user' && pass == 'password'
    end
  end

  def authenticate_digest
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end
end
