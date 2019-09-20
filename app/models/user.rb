class User < ApplicationRecord
  has_and_belongs_to_many :subreddits
  has_many :posts
  has_many :comments

  validates :name, :username, :email, :password, :profile_pic_url, presence: true
  validates :username, :email, uniqueness: true
  validates :password, length: {in: 8..20}
  validates :description, length: {maximum: 300}
end
