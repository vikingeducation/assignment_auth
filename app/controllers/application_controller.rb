class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user, :except => [:new, :edit, :create, :update, :destroy]

  private

  def authenticate_user
    authenticate_or_request_with_http_basic('Message to User') do |username, password|
      username == 'Foo' && password = 'bar'
    end
  end

end