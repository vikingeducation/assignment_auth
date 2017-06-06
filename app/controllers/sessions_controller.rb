class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = "Signed in successfully"
      redirect_to users_path
    else
      flash.now[:danger] = "Failed to sign in"
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "Signed out successfully"
    redirect_to users_path
  end

end
