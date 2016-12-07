class SessionsController < ApplicationController
  skip_filter :authenticate_user

  def new
  end

  def create
    @user = User.find_by_email( params[:email] )

    if @user && @user.authenticate( params[:password] )
      log_in @user
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
