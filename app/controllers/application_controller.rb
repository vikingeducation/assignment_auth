class ApplicationController < ActionController::Base

  before_action :require_login

  # USERS = {"nora" => "password"}

  # before_action :authenticate


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # basic auth exercise
  # http_basic_authenticate_with  name: "foo",
  #                               password: "bar",
  #                               except: [:index, :show]

  # digest exercise
  # def authenticate
  #   authenticate_or_request_with_http_digest do |username|
  #     USERS[username]
  #   end
  # end

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
  helper_method :current_user

  def signed_in_user?
    !!current_user
  end
  helper_method :signed_in_user?

  private

  def require_login
    unless signed_in_user?
      flash[:error] = "Not authorized! Sign in please!"
      redirect_to login_path
    end
  end

  def require_current_user
    unless params[:id] == current_user.id.to_s
      flash[:error] = "You're not authorized to view this"
      redirect_to root_path
    end
  end
end
