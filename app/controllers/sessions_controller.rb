class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by_email(params[:username])
		if @user && @user.authenticate(params[:password_digest])
			sign_in(@user)
			flash[:success] = "Logged In"
			redirect_to users_path
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
