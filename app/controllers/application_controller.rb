class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user, :only => [:index, :show]

  def authenticate_user
    authenticate_or_request_with_http_basic('sample') do |username, password|
      username = 'admin' && password = 'password'
    end
  end

end