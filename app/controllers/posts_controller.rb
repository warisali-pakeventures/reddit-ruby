class PostsController < ApplicationController
  include SessionHelper
  before_action :set_params, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
    @user = User.find(session[:userid])
  end

  # GET /posts/new
  def new
    @subreddit = Subreddit.find(params[:subreddit_id])
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @subreddit.posts << @post
    @user.posts << @post

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_params
    begin
      @subreddit = Subreddit.find(params[:subreddit_id])
      @post = Post.find(params[:id])
      @user = logged_in_user
    rescue
      render plain: '404 Not Found!', status: 404
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :description)
  end
end
