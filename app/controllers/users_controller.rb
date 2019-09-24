class UsersController < ApplicationController
  include SessionHelper

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  # def index
  #   @users = User.all
  # end

  # GET /login
  def login
    if is_user_logged_in?
      redirect_to :dashboard
    end
  end

  # POST /login
  def login_user
    username = params[:username]
    password = params[:password]

    if username && password && User.authenticate(username, password)
      create_session User.find_by_username(username).id
      return redirect_to :dashboard
    end

    flash[:error] = 'Invalid Username or Password!'
    redirect_to :login
  end

  # /logout
  def logout
    log_user_out
    redirect_to :login
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # GET /dashboard
  def dashboard
    if is_user_logged_in?
      @user = logged_in_user
    else
      redirect_to :login
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      session[:userid] = @user.id
      redirect_to dashboard_path
    else
      render :new
    end

  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :username, :profile_pic_url, :description, :email, :password)
  end

end
