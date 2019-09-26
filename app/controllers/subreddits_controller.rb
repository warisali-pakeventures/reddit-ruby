class SubredditsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_subreddit, except: [:index, :new, :edit]

  def index
    @subreddits = Subreddit.all
  end

  def show
    @posts = @subreddit.posts
                 .paginate(page: params[:page], per_page: 10)
                 .order(updated_at: :desc, created_at: :desc)
    respond_to do |format|
      format.html
      format.js
    end
    # @posts = @subreddit.posts.order(updated_at: :desc, created_at: :desc)
  end

  def join
    @subreddit.add_member(current_user)
    redirect_to @subreddit
  end

  def leave
    @subreddit.remove_member(current_user)
    redirect_to @subreddit
  end

  def new
    @subreddit = Subreddit.new
  end

  def edit
  end

  def create
    @subreddit = Subreddit.new(subreddit_params)

    if @subreddit.save
      redirect_to @subreddit
    else
      render :new
    end
  end

  def update
    if @subreddit.update(subreddit_params)
      redirect_to @subreddit
    else
      render :edit
    end
  end

  def destroy
    @subreddit.destroy
    redirect_to subreddits_url
  end

  private

  def set_subreddit
    @subreddit = Subreddit.find_by_id(params[:id])
  end

  def subreddit_params
    params.require(:subreddit).permit(:name, :description)
  end

end
