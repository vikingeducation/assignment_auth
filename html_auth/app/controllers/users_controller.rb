class UsersController < ApplicationController
  #before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  #skip_filter :authenticate_user, :only => [:show, :index]
  skip_before_action :require_login, :only => [:new, :create, :index, :show]
  
  before_action :require_current_user, :only => [:edit, :update, :destroy]
  
  #skip_before_action :require_login, :only => [:new, :create, :index, :show]

  # GET /users
  # GET /users.json
  def index
    #reset_session
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(whitelisted_user_params)
      if @user.save
        
        sign_in(@user)
        flash[:success] = "new user created"
        redirect_to user_path(@user)
        #format.html { redirect_to @user, notice: 'User was successfully created.' }
        #format.json { render :show, status: :created, location: @user }
      else
        flash.now[:error] = "fail to create one"
        render :new
        #format.html { render :new }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    #respond_to do |format|
    @user = User.find(params[:id])
      if @user.update(whitelisted_user_params)
        flash[:success] = "user updated"
        #format.html { redirect_to @user, notice: 'User was successfully updated.' }
        #format.json { render :show, status: :ok, location: @user }
        redirect_to users_path
      else
        flash.now[:error] = "user update fail"
        render :edit
      end
    #end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    reset_session
    flash[:success] = "user has been deleted and logged out"
=begin
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
=end
    redirect_to users_path
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
      params.require(:user).permit(
                                :username,
                                :email,
                                :password,
                                :password_confirmation
                                )
    end
end
