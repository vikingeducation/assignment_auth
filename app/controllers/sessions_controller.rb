class SessionsController < ApplicationController
  skip_filter :require_login, only: [:new, :create]
  def new
    

  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = "You were signed in"
      redirect_to users_path
    else

      flash[:error] = "Unable to sign in"
      render :new
    end
  end


  def destroy
    sign_out
    flash[:success] = "You were signed out"
    redirect_to users_path

  end
end
