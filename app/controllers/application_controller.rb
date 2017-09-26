class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  private

  # Simply store our ID in the session
  # and set the current instance user var
  def sign_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  # reverse the sign_in... 
  def sign_out
    @current_user = nil
    session.delete (:user_id)
  end

  # Store the current user in an instance variable so we do not 
  # have to make repeated calls to our database when this is 
  # used many times.
  # If we have not set the instance variable, set that variable
  # using the user_id in our session.
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  # Will turn the surrent_user into a boolean
  # e.g. 'nil' becomes false and anything else true.
  def signed_in_user?
    !!current_user
  end
  helper_method :signed_in_user?

  def require_login
    unless signed_in_user?
      flash[:error] = "Not authorized, please sign in!"
      redirect_to login_path # this is custom route
    end
  end

  def require_current_user
    # don't forget params is a string
    unless params[:id] == current_user.id.to_s
      flash[:error] = "You are not authorized to do this"
      redirect_to root_path
    end
  end

end



# Code from previous HTTP basic/digest exercise 
# ------------------------------------------------

# class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  # showing off the :except (you'd put this in an
  # individual controller in reality)
  # before_action :authenticate_user, :except => [:new, :index]

  # For Digest Auth
  # USERS = { "David" => "david_1", 
  #           "Moshe" => "moshe_1",
  #           "Shelley" => "shelley_1",
  #           "Howard" => "howard_1",
  #           "Matt" => "matt_1" }

  # private

  # The HTTP Digest version (better)
  # ------------------------------------------------
  # def authenticate_user
  #   authenticate_or_request_with_http_digest do |username|
  #     USERS[username]
  #   end
  # end

# end

