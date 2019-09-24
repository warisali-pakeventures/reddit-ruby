class User < ApplicationRecord
  has_and_belongs_to_many :subreddits
  has_many :posts
  has_many :comments

  validates :name, :username, :email, :password, :profile_pic_url, presence: true
  validates :username, :email, uniqueness: true
  validates :password, length: {in: 8..20}
  validates :description, length: {maximum: 300}

  # TODO: validate url format
  # TODO: validate email format
  #

  def self.authenticate(username, password)
    begin
      user = User.find_by_username(username)
      return user.password == password
    rescue
      return false
    end
  end

end
