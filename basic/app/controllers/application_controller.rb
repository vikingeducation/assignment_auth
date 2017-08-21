class ApplicationController < ActionController::Base
  http_basic_authenticate_with :name => "Carl",
                               :password => "carl62",
                               :except => [:index, :show, :new, :create]
  protect_from_forgery with: :exception
end
