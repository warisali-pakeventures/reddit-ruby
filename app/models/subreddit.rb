class Subreddit < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :posts

  validates :name, uniqueness: true
  validates :name, :description, presence: true
  validates :description, length: {maximum: 300}
end
