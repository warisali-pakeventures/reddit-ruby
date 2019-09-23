class UsersController < ApplicationController
  include SessionHelper

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  # def index
  #   @users = User.all
  # end

  def login
    if is_user_logged_in?
      redirect_to :dashboard
    end
  end

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

  def dashboard
    if is_user_logged_in?
      @user = logged_in_user
    else
      redirect_to :login
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      session[:userid] = @user.id
      redirect_to '/dashboard', notice: 'User was successfully created.'
    else
      render :new
    end

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html {redirect_to @user, notice: 'User was successfully updated.'}
        format.json {render :show, status: :ok, location: @user}
      else
        format.html {render :edit}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html {redirect_to users_url, notice: 'User was successfully destroyed.'}
      format.json {head :no_content}
    end
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
