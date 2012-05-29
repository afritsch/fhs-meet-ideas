require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  test "should respond to projects" do
    appointment = appointments(:one)
    assert_respond_to appointment, :project, "appointments do not respond to project"
  end
  
  test "should require description with 3 characters at least" do
    appointment = Appointment.new(:description => "De")
    assert !appointment.save, "testcase 'description requires at least 3 characters' failed"
  end
end
