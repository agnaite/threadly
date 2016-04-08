require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'it can be created' do
    assert Post.new(comment: 'this is a test').save == true
  end

  test 'must have a comment to be valid' do
    assert Post.new(comment: nil).valid? == false
  end

  test 'has a comment' do
    post = Post.new(comment: 'this is a test')
    post.save!
    assert post.reload.comment.nil? == false
  end

  test 'it can be assigned to a user' do
    user = User.create! password: 'atestpassword', first_name: 'Hector', last_name: 'Cat', username: "hector", email: 'hector@pivotbio.com'
    post = Post.new(comment: 'test', user: user)
    post.save!
    assert post.reload.user == user
  end
end
