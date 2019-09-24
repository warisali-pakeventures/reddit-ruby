class Post < ApplicationRecord
  acts_as_commontable dependent: :destroy
  validates :title, presence: true
end
