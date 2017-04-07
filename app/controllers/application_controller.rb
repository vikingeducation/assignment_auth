class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  http_basic_authenticate_with( name: 'user', password: 'password', only: [:update, :create, :destroy])
end
