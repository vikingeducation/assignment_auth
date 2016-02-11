class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = "You have signed in successfully!"
      redirect_to root_url
    else
      flash[:error] = "We couldn't sign you in!"
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
