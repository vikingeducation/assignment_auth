class UsersController < ApplicationController
  # before_action :require_login, :except => [:new, :create]
  # before_action :require_current_user, :only => [:edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # Basic HTTP Auth
  # Insecure!!!
  # HTTP Header: Authorization: Basic YWRtaW46YWRtaW4=
  # Base64.decode64('YWRtaW46YWRtaW4=')
  # "admin:admin"
  # http_basic_authenticate_with  :name => 'admin',
  #                               :password => 'admin',
  #                               :except => [:index, :show]

  # Disgest HTTP Auth
  USERS = {'admin' => 'admin'}
  before_action :authenticate,
                :except => [:index, :show]

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
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        sign_in(@user)
        format.html { redirect_to @user, :flash => {success: 'User was successfully created.'} }
        format.json { render :show, status: :created, location: @user }
      else
        flash.now[:error] = 'User not created'
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, :flash => {success: 'User was successfully updated.'} }
        format.json { render :show, status: :ok, location: @user }
      else
        flash.now[:error] = 'User not updated'
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    sign_out
    respond_to do |format|
      format.html { redirect_to login_path, :flash => {success: 'User was successfully destroyed.'} }
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
      params.require(:user)
        .permit(
          :username,
          :email,
          :password,
          :password_confirmation
        )
    end

    def authenticate
      authenticate_or_request_with_http_digest do |username|
        USERS[username]
      end
    end
end




