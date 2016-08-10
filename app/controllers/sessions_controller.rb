class SessionsController < ApplicationController
  def new
    
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = "You've been signed in."
      redirect_to root_path
    else
      flash.now[:errors] = "You didn't get signed in."
      render :new
    end
  end

  def destroy
    sign_out
    flash[:message] = "You've been signed out."
    redirect_to root_path    
  end
end
