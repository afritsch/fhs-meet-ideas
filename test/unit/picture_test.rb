require 'test_helper'

class PictureTest < ActiveSupport::TestCase
  test "should respond to projects" do
    picture = pictures(:one)
    assert_respond_to picture, :project, "pictures do not respond to project"
  end
  
  test "should require title with at least 3 characters" do
    picture = Picture.new(:title => "Ti")
    assert !picture.save, "testcase 'title requires at least 3 characters' failed"
  end
end
