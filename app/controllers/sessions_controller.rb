class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])

      # we'll put this logic into a simple helper
      sign_in(@user)
      flash[:notice] = "You've successfully signed in"
      redirect_to users_path
    else
      flash.now[:notice] = "We couldn't sign you in"
      render :new
    end
  end

  def destroy
    # another simple helper
    sign_out
    flash[:notice] = "You've successfully signed out"
    redirect_to users_path
  end
end
