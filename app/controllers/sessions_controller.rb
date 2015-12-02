class SessionsController < ApplicationController

  def new
  end


  def create
    user = User.find_by_email(session_params[:email])
    if user && user.authenticate(session_params[:password])
      sign_in(user)
      redirect_back_or(users_path, "Welcome back #{user.username}.")
    else
      redirect_to signin_path, notice: 'There was a problem signing you in.'
    end
  end


  def destroy
    if sign_out
      redirect_to users_path, notice: "Signed Out!"
    else
      redirect_to users_path, notice: "Couldn't Sign You Out!"
    end
  end


  private


  def session_params
    params.permit(:email, :password)
  end

end
