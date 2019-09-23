class Vote < ApplicationRecord
  belongs_to :votable, polymorphic: true
  belongs_to :user

  validates :upvote, inclusion: {in: [true, false]}
end
