class SessionsController < ApplicationController

  def create
    @user = User.find_by_email(params;:email])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = "Sign in success!"
      redirect_to root_url
    else
      flas.now[:error] = "Sign in failure!"
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "Sign out success!"
    redirect_to root_url
  end

end
