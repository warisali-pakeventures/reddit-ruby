require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users

  test "user attributes must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:name].any?
    assert user.errors[:username].any?
    assert user.errors[:profile_pic_url].any?
    assert user.errors[:email].any?
    assert user.errors[:password].any?
  end

  # test url validation

  test "user email should be unique" do
    user = User.new(name: 'super',
                  username: 'super234',
                  profile_pic_url: 'http://googlc.om',
                  email: users(:one).email,
                  password: 'asdfasdf')

    assert user.invalid?
    assert [I18n.translate('errors.message.taken')], user.errors[:email]
  end

  test "user username should be unique" do
    user = User.new(name: 'super',
                  username: users(:one).username,
                  profile_pic_url: 'http://googlc.om',
                  email: 'asdfasf@asdf.com',
                  password: 'asdfasdf')

    assert user.invalid?
    assert [I18n.translate('errors.message.taken')], user.errors[:username]
  end

  test "user password should be between 8 and 20" do
    user = users(:one)
    user.password = '01'

    assert user.invalid?
    assert user.errors[:password].any?

    user.password = '123456789012345678901'

    assert user.invalid?
    assert user.errors[:password].any?

    user.password = 'asdfasdf'
    assert user.valid?
    assert user.errors[:password].empty?
  end

  test "user description should be less than 300" do
    user = users(:one)
    user.description = 'a' * 301

    assert user.invalid?
    assert user.errors[:description].any?

    user.description = 'asdfasdf'
    assert user.valid?
    assert user.errors[:description].empty?
  end
end
