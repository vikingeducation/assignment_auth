class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])

      sign_in(@user)
      flash[:success] = "You've signed in"
      redirect_to @user
    else
      flash.now[:error] = "Sorry, there was an error"
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "Goodbye"

    redirect_to root_url
  end

end
