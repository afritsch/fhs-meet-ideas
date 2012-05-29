require 'test_helper'

class PictureTest < ActiveSupport::TestCase
  test "should repsond to projects" do
    picture = pictures(:one)
    assert_respond_to picture, :project
  end
end
