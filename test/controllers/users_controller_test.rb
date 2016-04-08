require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user = users(:agne)
    @other_user = users(:austin)
  end

  test "should redirect following when not logged in" do
    get :following, id: @user
    assert_redirected_to 'login'
  end

  test "should redirect followers when not logged in" do
    get :followers, id: @user
    assert_redirected_to 'login'
  end
end
