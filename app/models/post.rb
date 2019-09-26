class Post < ApplicationRecord
  acts_as_commontable dependent: :destroy
  acts_as_votable

  validates :title, presence: true

  belongs_to :subreddit
  belongs_to :user

  def timestamp
    created_at.strftime('%d %B %Y %H:%M:%S')
  end
end
