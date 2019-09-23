require 'test_helper'

class SubredditTest < ActiveSupport::TestCase
  fixtures :subreddits
  fixtures :users

  test "subreddit arguments must not be empty" do
    subreddit = Subreddit.new
    assert subreddit.invalid?
    assert subreddit.errors[:name].any?
    assert subreddit.errors[:description].any?
  end

  test "subreddit name must be unique" do
    subreddit = Subreddit.new(name: subreddits(:one).name,
                              description: 'some description')
    assert subreddit.invalid?
    assert [I18n.translate('errors.message.taken')], subreddit.errors[:name]
  end

  test "subreddit description should be less than 300" do
    subreddit = subreddits(:one)
    subreddit.description = 'a' * 301

    assert subreddit.invalid?
    assert subreddit.errors[:description].any?

    subreddit.description = 'asdfasdf'
    assert subreddit.valid?
    assert subreddit.errors[:description].empty?
  end

  test "user should be able to join subreddit" do
    subreddit = subreddits(:one)
    user = users(:one)

    subreddit.users << user

    assert_includes(subreddit.users, user)
    assert_includes(user.subreddits, subreddit)
  end

  test "user should be able to post on subreddit" do
    subreddit = subreddits(:one)
    user = users(:one)

    post = Post.new(title: 'post1', description: 'adsf adsf')
    user.posts << post
    subreddit


  end
end
