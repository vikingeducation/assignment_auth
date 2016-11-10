class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def create
    @user = User.find_by_email(params[:email])

    if @user.save && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:notice] = "Successfully logged in..."
      redirect_to users_url
    else
      flash.now[:error] = "Your email or password is incorrect..."
      render "new"
    end
  end

  def destroy
    sign_out
    flash[:notice] = "Successfully destroyed..."
    redirect_to users_url
  end
end
