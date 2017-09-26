class SessionsController < ApplicationController
  skip_before_action :require_login, :only => [:new, :create]
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = "You are signed in"
      redirect_to root_path
    else
      flash.now[:success] = "There was an error signing in"
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "You are signed out."
    redirect_to root_path
  end
end
