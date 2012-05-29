require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  test "should require longer title" do
    role = Role.new(:title => "Ti", :name => "Name")
    assert !role.save
  end
  
  test "should require longer name" do
    role = Role.new(:title => "Title", :name => "Na")
    assert !role.save
  end
  
  test "should repsond to projects" do
    role = roles(:one)
    assert_respond_to role, :project
  end
end
