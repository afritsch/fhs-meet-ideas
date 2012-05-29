require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "should respond to projects and users" do
    comment = comments(:one)
    assert_respond_to comment, :project, "comments do not respond to project"
    assert_respond_to comment, :user, "comments do not respond to user"
  end
  
  test "should require content with at least 3 characters" do
    comment = Comment.new(:content => "Co")
    assert !comment.save, "testcase 'content requires at least 3 characters' failed"
  end
end
