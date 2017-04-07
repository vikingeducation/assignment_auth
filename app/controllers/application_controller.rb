class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in_user?

  USERS = { 'user' => 'password'}

  # before_action :authenticate_basic, except: [:show, :index]
  # before_action :authenticate_digest, except: [:show, :index]
  before_action :require_login, except: [:new, :index, :create, :show]


  private

  def require_current_user
    unless params[:id] == current_user.id.to_s
      flash[:error] = "Guards! Seize #{['him', 'her'].sample}! Just kidding. You can look but you can't touch!"
      redirect_to root_path
    end
  end

  def require_login
    unless signed_in_user?
      flash[:error] = "Intruder alert! Just kidding. Please sign in."
      redirect_to login_session_path
    end
  end

  def sign_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in_user?
    !!current_user
  end

  def authenticate_basic
    authenticate_or_request_with_http_basic do |u, pass|
      u == 'user' && pass == 'password'
    end
  end

  def authenticate_digest
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end
end
