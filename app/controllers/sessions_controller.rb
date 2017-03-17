class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = "blah blah sign in success"
      redirect_to root_url
    else
      flash.now[:error] = "blah blah sign in fail"
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "blah blah sign out success"
    redirect_to root_url
  end
end
