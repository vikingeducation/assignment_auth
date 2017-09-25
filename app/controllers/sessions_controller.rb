class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      login(@user)
      flash[:success] = "You've successfully logged in."
      redirect_to root_url
    else
      flash.now[:error] = "We couldn't log you in."
      render :new
    end
  end

  def destroy
    logout
    flash[:success] = "You've successfully logged out."
    redirect_to root_url
  end
end
