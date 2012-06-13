require 'test_helper'

class FollowupTest < ActiveSupport::TestCase
  test "should respond to project and user" do
    followup = followups(:one)
    assert_respond_to followup, :project, "appointments do not respond to project"
    assert_respond_to followup, :user, "appointments do not respond to user"
  end
end
