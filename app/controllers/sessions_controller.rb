class SessionsController < ApplicationController

  skip_before_action :require_login, only: [:create, :destroy]

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])

      sign_in(@user)
      flash[:success] = "Welcome #{@user.username} !"
      redirect_to users_path
    else
      flash[:danger] = "We couldn't sign you in"
      redirect_to users_path
    end
  end

  def destroy
    if sign_out
      flash[:success] = "You just log out"
      redirect_to users_path
    end
  end
end
