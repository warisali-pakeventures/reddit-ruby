class Post < ApplicationRecord
  acts_as_commontable dependent: :destroy
  acts_as_votable

  validates :title, presence: true

  belongs_to :subreddit
  belongs_to :user
end
