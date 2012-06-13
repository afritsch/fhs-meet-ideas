require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "should respond to user" do
    project = projects(:one)
    assert_respond_to project, :user, "projects do not respond to user"
  end

  test "should create a project" do
    project = Project.new(:title => "Title", :status => "Status", :description => "Description")
    assert project.save, "testcase 'create a project' failed"
  end

  test "should require title with at least 3 characters" do
    project = Project.new(:title => "Ti", :status => "Status", :description => "Description")
    assert !project.save, "testcase 'title requires at least 3 characters' failed"
  end

  test "should require status with at least 3 characters" do
    project = Project.new(:title => "Title", :status => "st", :description => "Description")
    assert !project.save, "testcase 'status requires at least 3 characters' failed"
  end

  test "should require description with at least 10 characters" do
    project = Project.new(:title => "Title", :status => "Status", :description => "Descripti")
    assert !project.save, "testcase 'description requires at least 10 characters' failed"
  end
end
