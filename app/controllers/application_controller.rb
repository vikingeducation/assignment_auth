class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login


  private

	  def sign_in(user)
	    session[:user_id] = user.id
	    @current_user = user
	  end

	  def require_current_user
	    # don't forget that params is a string!!!
	    unless params[:id] == current_user.id.to_s
	      flash[:error] = "You're not authorized to view this"
	      redirect_to root_url_path
	    end
	  end


	  def sign_out
	    @current_user = nil
	    session.delete(:user_id)
	  end


	  def current_user
		    @current_user ||= User.find(session[:user_id]) if session[:user_id]
	  end
	  helper_method :current_user

	  def signed_in_user?
	    !!current_user
	  end
	  helper_method :signed_in_user?

	  def require_login
	    unless signed_in_user?
	      flash[:error] = "Not authorized, please sign in!"
	      redirect_to login_path  #< Remember this is a custom route
	    end
	  end

end
