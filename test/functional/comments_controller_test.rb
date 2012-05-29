require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  def setup
    @request.session[:id] = users(:one).id
  end
  
  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, :project_id => projects(:one).id, :comment => { }
    end
    assert_redirected_to project_path(assigns(:project))
  end
end
