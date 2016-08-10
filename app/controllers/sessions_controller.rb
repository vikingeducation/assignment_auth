class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      sign_in_user(@user)
      flash[:success] = "Your signed in!"
      redirect_to users_path
    else
      flash[:error] = "You couldn't be signed in"
      render :new
    end
  end

  def destroy
    sign_out_user
    flash[:success] = "You've successfully signed out"
    redirect_to users_path
  end

end
