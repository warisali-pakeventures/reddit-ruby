class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    commontator_thread_show(@post)
  end

  def new
    @post = Post.new
    @post.subreddit = Subreddit.find_by_id(params[:subreddit_id])
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to @subreddit
  end

  private

  def set_post
    @post = Post.find_by_id(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :subreddit_id, :user_id)
  end
end
