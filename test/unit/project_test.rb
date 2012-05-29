require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "should create a project" do
    project = Project.new(:title => "Title", :status => "Status", :description => "Description")
    assert project.save
  end
  
  test "should require longer title" do
    project = Project.new(:title => "Ti", :status => "Status", :description => "Description")
    assert !project.save
  end
  
  test "should require longer status" do
    project = Project.new(:title => "Title", :status => "st", :description => "Description")
    assert !project.save
  end
  
  test "should require longer description" do
    project = Project.new(:title => "Title", :status => "Status", :description => "Descripti")
    assert !project.save
  end
end
