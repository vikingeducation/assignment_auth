class SessionsController < ApplicationController
  skip_before_action :require_login, :only => [:new, :create]

  def new
  end
  
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])

      #we'll put this logic into a simple helper
      sign_in(@user)
      flash[:success] = "You're signed in."
      redirect_to root_url
    else
      flash.now[:error] = "Something went wrong with your signin."
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "You've successfully signed out"
    redirect_to root_url
  end
end
