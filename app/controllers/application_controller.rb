class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # before_action :authenticate_user, :except => [:new, :index, :show ]
  
  # The HTTP Basic version (better)
  # http_basic_authenticate_with  :name => "foo",
  #                               :password => "bar",
  #                               :only => [:update, :create]

  # before_action :require_login, :except => [:new, :create, :index]
  # skip_before_action :require_login, :only => [:new, :create, :index]

  before_action :require_login
  
  private

  # The HTTP Basic version
  # def authenticate_user
  #   authenticate_or_request_with_http_basic('Checking credentials') do |username, password|
  #     username == "foo" && password == "bar"
  #   end
  # end



  # USERS = { "user1" => "hellooooo", 
  #           "user2" => "pwd2" }
  
  # The HTTP Digest version (better)
  # def authenticate_user
  #   authenticate_or_request_with_http_digest do |username|
  #     USERS[username]
  #   end
  # end

  # Simply store our ID in the session
  # and set the current user instance var
  def sign_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  # reverse the sign in...
  def sign_out
    @current_user = nil
    session.delete(:user_id)
  end

  
  # Store the current user in an instance variable so we don't
  # have to make repeated calls to our database when this method
  # is used many times.
  # If we haven't set the instance variable, set that variable
  # using the user_id in our session.
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  # Will turn the current_user into a boolean
  # e.g. `nil` becomes false and anything else true.
  def signed_in_user?
    !!current_user
  end
  helper_method :signed_in_user?

  # call our other friendly helper, `signed_in_user?`
  def require_login
    unless signed_in_user?
      flash[:error] = "Not authorized, please sign in!"
      redirect_to login_path  #< Remember this is a custom route
    end
  end

   def require_current_user
    # don't forget that params is a string!!!
    unless params[:id] == current_user.id.to_s
      flash[:error] = "You're not authorized to view this"
      redirect_to root_url
    end
  end 

end


