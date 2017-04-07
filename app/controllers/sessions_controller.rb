class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = "Success! You've been signed in"
      redirect_to @current_user
    else
      flash[:error] = "Sorry! Your login info is incorrect"
      render :new
    end
  end

  def destroy
    sign_out
    return redirect_to :users
  end


end
