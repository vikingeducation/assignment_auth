class SessionsController < ApplicationController

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      sign_in @user
      redirect_to root_url, notice: "Successfully signed in!"
    else
      flash.now[:alert] = "There was a problem signing you in."
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_url, notice: "Successfully logged out!"
  end
end
