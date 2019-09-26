class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @posts = []
    current_user.subreddits.includes(:posts).each do |s|
      @posts += s.posts.order(updated_at: :desc, created_at: :desc)
                    .limit(3).to_a
    end
  end

end
