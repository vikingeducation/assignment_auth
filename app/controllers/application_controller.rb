class ApplicationController < ActionController::Base
  http_basic_authenticate_with  :name => "foo",
                                  :password => "bar",
                                  :only => [:update, :create]
  protect_from_forgery with: :exception
end
