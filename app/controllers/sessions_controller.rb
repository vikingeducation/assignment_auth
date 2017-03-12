class SessionsController < ApplicationController

	def new

	end

	def create
    	@user = User.find_by_email(params[:email])
    	if @user && @user.authenticate(params[:password])
      		sign_in(@user)
      		flash[:success] = "You've successfully signed in"
      		redirect_to root_url
    	else
      		flash.now[:error] = "We couldn't sign you in"
      		render :new
    	end
  	end

  	def destroy
    	# another simple helper
    	sign_out
    	flash[:success] = "You've successfully signed out"
    	redirect_to root_url
	end
end
