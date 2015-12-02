class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def sign_in(user)
    @current_user= user
    session[:user_id] = user.id
  end


  def sign_out
    @current_user = nil
    session.delete(:user_id)
    @current_user.nil? && session[:user_id].nil?
  end


  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end
  helper_method :current_user


  def signed_in_user?
    !!current_user
  end
  helper_method :signed_in_user?


  def require_sign_in
    unless signed_in_user?
      store_location
      redirect_to signin_path, notice: "You must sign in to do that!"
    end
  end


  def store_location
    session[:forwarding_url] = request.fullpath if request.get?
  end


  def redirect_back_or(location, notice = nil)
    redirect_to((session[:forwarding_url] || location), notice: "#{notice}")
    session.delete(:forwarding_url)
  end

end
