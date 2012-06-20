require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  test "should respond to project and user" do
    role = roles(:one)
    assert_respond_to role, :project, "roles do not respond to project"
    assert_respond_to role, :user, "roles do not respond to user"
  end

  test "should require title with at least 3 characters" do
    role = Role.new(:title => "Ti", :name => "Name")
    assert !role.save, "testcase 'title requires at least 3 characters' failed"
  end
end
