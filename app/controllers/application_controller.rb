class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: "name", password: "something", except: [:index, :show]
  protect_from_forgery with: :exception
end
