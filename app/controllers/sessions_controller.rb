class SessionsController < ApplicationController

  def create
    @user = User.find_by_username(params[:username])

    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = "Signed in successfully!"
      redirect_to @user
    else
      flash[:error] = "Ya blew it!"
      render :new
    end
  end

  def destroy
      sign_out
      flash[:success] = "Signed out successfully!"
      redirect_to root_url
  end

end
