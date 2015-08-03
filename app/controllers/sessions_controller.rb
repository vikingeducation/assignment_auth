class SessionsController < ApplicationController

  skip_before_action :require_login, :only => [:new, :create]


  def new
  end


  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = "Welcome!"
      redirect_to root_url
    else
      flash.now[:danger] = "Login Error!"
      render :new
    end
  end


  def destroy
    sign_out
    flash[:success] = "You have logged out."
    redirect_to root_url
  end

end
