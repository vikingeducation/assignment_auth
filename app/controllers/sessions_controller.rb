class SessionsController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      successful_create
    else
      failed_create
    end
  end

  def destroy
    sign_out
    flash[:success] = "You've signed out."
    redirect_to root_url
  end

  private
    def successful_create
      sign_in(@user)
      flash[:success] = "Successfully signed in!"
      redirect_to root_url
    end

    def failed_create
      flash[:danger] = "We couldn't sign you in."
      render :new
    end
end
