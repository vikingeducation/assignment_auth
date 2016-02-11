class SessionsController < ApplicationController

  def new
  end


  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = "Yay! You're in!"
      redirect_to root_path
    else
      flash.now[:error] = "You're not allowed in!"
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "Bye bye"
    redirect_to root_path
  end



end
