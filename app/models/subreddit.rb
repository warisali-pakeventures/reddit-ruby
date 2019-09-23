class Subreddit < ApplicationRecord
  # A subreddit can have many users
  # and a user can have join many subreddits. therefore many to many relationship
  has_and_belongs_to_many :users

  has_many :posts

  validates :name, uniqueness: true
  validates :name, :description, presence: true
  validates :description, length: {maximum: 300}
end
