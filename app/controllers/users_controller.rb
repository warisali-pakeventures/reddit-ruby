class UsersController < ApplicationController
  before_action :authenticate_user!

  # GET /dashboard
  def dashboard
    @user = current_user
    @posts = []
    @user.subreddits.each do |s|
      @posts += s.posts.order(updated_at: :desc, created_at: :desc)
                    .limit(3).to_a
    end
  end

end
