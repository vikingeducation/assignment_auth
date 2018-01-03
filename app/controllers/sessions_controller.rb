class SessionsController < ApplicationController

  # permits these actions to happen without logging in first
  skip_before_action :require_login, :only => [:new, :create]

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])

      sign_in(@user)
      flash[:success] = "You've successfully signed in"
      redirect_to root_url
    else
      flash.now[:error] = "We couldn't sign you in"
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "You've successfully signed out"
    redirect_to root_url
  end


end
