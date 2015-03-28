class UsersController < ApplicationController
  before_action :require_login, :except => [:new, :create]
  before_action :require_current_user, :only => [:edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = current_user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(whitelisted_user_params)
    if @user.save
      sign_in(@user)
      flash[:success] = "Created new user!"
      redirect_to @user
    else
      flash.now[:error] = "Failure!"
      render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if current_user.update(whitelisted_user_params)
      flash[:success] = "Successfully updated your profile!"
      redirect_to current_user
    else
      flash.now[:failure] = "Failed to update your profile"
      render :edit
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email)
    end

    def whitelisted_user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
