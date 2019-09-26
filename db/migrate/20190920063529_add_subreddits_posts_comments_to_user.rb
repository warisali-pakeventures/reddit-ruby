class AddSubredditsPostsCommentsToUser < ActiveRecord::Migration[6.0]
  def change
    create_table :subreddits_users do |t|
      t.belongs_to :subreddit
      t.belongs_to :user
    end
  end
end
