class SessionsController < ApplicationController
  skip_before_action :require_login, :only => [:new, :create]

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = "You've successfully signed in"
      redirect_to :root
    else
      flash.now[:error] = "Can't sign in!"
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "You've successfully signed out!"
    redirect_to :root
  end


end
