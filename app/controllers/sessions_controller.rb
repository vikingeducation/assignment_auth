class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = "Successfully signed you in!"
      redirect_to users_path
    else
      flash[:error] = "Couldn't log you in :("
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "See you, space cowboy..."
    redirect_to users_path
  end
end
