class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  protected
  def sign_in(user)
    session[:user_id] = user.id
    @current_user = user
    @current_user == user && session[:user_id] == user.id
  end

  def sign_out
    @current_user = nil
    session.delete(:user_id)
    @current_user.nil? && session[:user_id].nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if User.exists?(session[:user_id])
  end
  helper_method :current_user

  def signed_in_user?
    !!current_user
  end
  helper_method :signed_in_user?

  def require_login
    unless signed_in_user?
      flash[:error] = 'You must sign in to do that'
      redirect_to login_path
    end
  end

  def require_current_user
    unless current_user && params[:id].to_i == current_user.id.to_i
      flash[:error] = 'You are unauthorized to perform that action'
      redirect_to root_path
    end
  end 
end
