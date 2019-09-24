class SubredditsController < ApplicationController
  include SessionHelper
  before_action :validate_session, only: [:new]
  before_action :set_subreddit, only: [:show, :edit, :update, :destroy, :show_by_name]


  # GET /subreddits
  def index
    @subreddits = Subreddit.all
  end

  # GET /subreddits/:id
  def show
    redirect_to subreddit_name_path(@subreddit.name)
  end

  # GET /r/:subreddit
  def show_by_name
    @posts = @subreddit.posts.all
    render :show
  end

  # GET /subreddits/new
  def new
    @subreddit = Subreddit.new
  end

  # GET /subreddits/1/edit
  def edit
  end

  # POST /subreddits
  def create
    @subreddit = Subreddit.new(subreddit_params)

    if @subreddit.save
      redirect_to subreddit_name_path(@subreddit.name)
    else
      render :new
    end
  end

  # PATCH/PUT /subreddits/1
  def update
    if @subreddit.update(subreddit_params)
      redirect_to @subreddit, notice: 'Subreddit was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /subreddits/1
  def destroy
    @subreddit.destroy
    redirect_to subreddits_url, notice: 'Subreddit was successfully destroyed.'
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subreddit
    begin
      @subreddit = Subreddit.find_by_name(params[:subreddit]) if params[:subreddit]
      @subreddit = Subreddit.find(params[:id]) if params[:id]
      @user = logged_in_user
    rescue
      render plain: '404 Not Found!', status: 404
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def subreddit_params
    params.require(:subreddit).permit(:name, :description)
  end

end
