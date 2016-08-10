class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  private

  def sign_in(user)
    session[:user_id] = user.id
    @current_user = user
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
      flash[:error] = "Not Authorized!"
      redirect_to login_path
    end
  end

  def require_current_user
    unless params[:id] == current_user.id.to_s
      flash[:error] = "Not Authorized!"
      redirect_to root_url
    end
  end

  def signed_in_current_user?(user)
    current_user && user.id == current_user.id
  end
  helper_method :signed_in_current_user?

  # http_basic_authenticate_with  name: "Leo",
  #                               password: "password",
  #                               only: [:update, :edit, :destroy]

  # before_action :authenticate, only: [:update, :edit, :destroy]
  # USERS = { "Leo" => "password"}
  #
  #
  # def authenticate
  #   authenticate_or_request_with_http_digest do |username|
  #     USERS[username]
  #   end
  # end
end
