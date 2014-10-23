class SessionController < ApplicationController
  skip_before_action :require_login, :only => [:new, :create]

  def new
  end
  
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])

      sign_in(@user)
      flash[:success] = "Signed in successfully"
      redirect_to root_url
    else
      flash.now[:error] = "Unsuccessful sign-in"
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "Successful sign-out"
    redirect_to root_url
  end
end