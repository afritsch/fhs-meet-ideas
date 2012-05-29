require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  test "should repsond to projects" do
    appointment = appointments(:one)
    assert_respond_to appointment, :project
  end
end
