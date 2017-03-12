class ApplicationController < ActionController::Base

  	protect_from_forgery with: :exception

 	USERS = { ENV["HTTP_BASIC_USER"] => ENV["HTTP_BASIC_PASS"] }

  	before_action :authenticate

  	private

    	def authenticate
      		authenticate_or_request_with_http_digest do |username|
        		USERS[username]
      		end
    	end
end
