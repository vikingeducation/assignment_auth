class SessionsController < ApplicationController
  def new
    # Show login screen
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = "You have signed in!"
      redirect_to @user
    else
      flash[:warning] = "Unable to log in."
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to users_path
  end
end
