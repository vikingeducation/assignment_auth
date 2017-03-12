class ApplicationController < ActionController::Base
	http_basic_authenticate_with  :name => ENV["HTTP_BASIC_USER"], 
                                  :password => ENV["HTTP_BASIC_PASS"],
                                  :only => [:update, :create]
  	protect_from_forgery with: :exception
end
