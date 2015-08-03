class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # authenticate_or_request_with_http_digest 	:except => [:index, :show]

private

  def sign_in(user)
  	session[:user_id] = user.id
  	current_user = user
  end

  def sign_out
  	current_user = nil
  	session.delete(:user_id)
  end

	def current_user
		return nil unless session[:user_id]
		@current_user ||= User.find(session[:user_id])
	end
	helper_method :current_user

	def current_user=(user)
		@current_user = user
	end

	def signed_in_user?
		!!current_user
	end
	helper_method :signed_in_user?



end
