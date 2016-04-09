require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should follow and unfollow a user" do
    agne = users(:agne)
    audy = users(:audy)

    assert_not agne.following?(audy)
    agne.follow(audy)
    assert agne.following?(audy)
    assert audy.followers.include?(agne)
    agne.unfollow(audy)
    assert_not agne.following?(audy)
  end

  test "can havefollowers do" do
    agne = users(:agne)
    audy = users(:audy)
    audy.followers << agne
    assert audy.save
    audy.reload
    assert audy.followers.include? agne
    assert agne.following.include? audy
  end
end
