require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should follow and unfollow a user" do
    agne = users(:agne)
    austin = users(:austin)

    assert_not agne.following?(austin)
    agne.follow(austin)
    assert agne.following?(austin)
    assert austin.followers.include?(agne)
    agne.unfollow(austin)
    assert_not agne.following?(austin)
  end
end
