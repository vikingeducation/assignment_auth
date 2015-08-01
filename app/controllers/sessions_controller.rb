class SessionsController < ApplicationController

	def create
		@user = User.find_by_email(params[:email])
		if @user && @user.authenticate(params[:password])
			sign_in(@user)
			flash[:success] = "You've signed in successfully!"
			redirect_to users_path
		else
			flash.now[:error] = "You couldn't be logged in"
			render :new
		end	
	end

	def destroy
		sign_out
		flash[:success] = "You've been logged out"
		redirect_to users_path
	end

end
