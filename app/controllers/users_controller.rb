class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # skip_filter :authenticate, only: [:show, :index]
  before_action :require_login, except: [:new, :create, :index, :show]

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
    @user = User.new(whitelist_user_params)
    if @user.save
      sign_in @user
      flash[:notice] = "You've successfully signed up!"
      redirect_to users_path
    else
      flash[:notice] = "You've failed to sign up. Please try again."
      render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(whitelist_user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "You've deleted your account."
      sign_out
    else
      flash[:notice] = "Your account could not be deleted."
    end
    redirect_to users_path
  end

  private
    def whitelist_user_params
      params.require(:user).permit(:username,
                                   :email,
                                   :password,
                                   :password_confirmation)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
