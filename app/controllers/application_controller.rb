class ApplicationController < ActionController::Base

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


end
