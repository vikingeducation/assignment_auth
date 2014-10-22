class SessionsController < ApplicationController

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = "Signed in as #{@user.username}"
      redirect_to users_path
    else
      flash.now[:error] = "Failed to sign in. Uh oh!"
      render users_path
    end
  end

  def destroy
    sign_out
    flash[:success] = "Signed Out"
    redirect_to users_path
  end

end
