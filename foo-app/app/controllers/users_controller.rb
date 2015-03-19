class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create, :index]
  before_action :require_current_user, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(whitelisted_user_params)
    if @user.save
      sign_in(@user)
      flash[:success] = "Created new user!"
      redirect_to @user
    else
      flash.now[:error] = "We could not create a new user"
      render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(whitelisted_user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    sign_out
    flash[:success] = "Goodbye forever"
    redirect_to root_url
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def whitelisted_user_params
      params.
        require(:user).
        permit( :username,
                :email,
                :password,
                :password_confirmation )
    end
end
