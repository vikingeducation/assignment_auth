class SessionsController < ApplicationController

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = "Successfully signed in"
      redirect_to root_url
    else
      flash[:error] = "Sorry, you couldn't be signed in"
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "You have successfully signed out"
    redirect_to root_url
  end
end
