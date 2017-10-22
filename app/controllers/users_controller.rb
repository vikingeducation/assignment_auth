class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :sign_out_if_exists, only: [:destroy]

  before_action :require_current_user, only: [:edit, :update, :destroy]
  skip_before_action :require_login, only: [:new, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
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

    respond_to do |format|
      if @user.save
        sign_in(@user)
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if current_user.update(whitelisted_user_params)
        # flash[:success] = "Your profile is successfully updated"
        format.html { redirect_to current_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: current_user }
      else
        format.html { render :edit }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    respond_to do |format|
      if @user.destroy
        format.html { redirect_to root_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { render :index }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def sign_out_if_exists
      @user = User.find(params[:id])
      if @user == current_user
        sign_out
        flash[:success] = "Successfully signed out and deleted account."
      else
        redirect_to :back, :flash => { :notice => 'Your are not authorized to do this!!'}
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.


    def whitelisted_user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
