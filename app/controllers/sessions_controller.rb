class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by_email(params[:email])
		if @user && @user.authenticate(params[:password])
			sign_in(@user)
			flash[:success] = "Logged In"
			redirect_to users
		else
			flash.now[:error] = "Could not sign in"
			render :new
		end
	end

	def destroy
		sign_out
		flash[:success] = "Signed out"
		redirect_to new_user_path
	end

end
