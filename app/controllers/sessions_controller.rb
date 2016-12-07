class SessionsController < ApplicationController

  skip_before_action :require_login, :only => [:new, :create]

  def new
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = "Success - Signed in!"
      redirect_to root_path 
    else
      flash.now[:error] = "Error - Sign in failed!"
      render :new
    end
  end

  def destroy 
    sign_out
    flash[:success] = "Success - Signed out!"
    redirect_to root_path
  end

end
