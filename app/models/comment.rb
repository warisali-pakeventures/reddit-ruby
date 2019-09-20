class Comment < ApplicationRecord
  has_many :replies, class_name: 'Comment', foreign_key: 'reply_to_id'
  belongs_to :reply_to, class_name: 'Comment', optional: true

  has_many :votes, as: :votable
end
