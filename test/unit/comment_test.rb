require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "should require longer content" do
    comment = Comment.new(:content => "Co")
    assert !comment.save
  end
  
  test "should repsond to projects and users" do
    comment = comments(:one)
    assert_respond_to comment, :project
    assert_respond_to comment, :user
  end
end
