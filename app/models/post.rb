class Post < ApplicationRecord
  acts_as_commontable dependent: :destroy

  validates :title, presence: true

  belongs_to :subreddit
  belongs_to :user
end
