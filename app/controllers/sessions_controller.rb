class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = 'You are signed in'
      redirect_to root_path
    else
      flash.now[:error] = 'Not signed in'
      render :new
    end
  end

  def destroy
    if sign_out
      flash[:success] = 'Signed out'
      redirect_to login_path
    else
      redirect_to request.referer
      flash[:error] = 'Not signed out'
    end
  end
end
