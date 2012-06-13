require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  def setup
    @request.session[:id] = users(:one).id
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, :project_id => projects(:one).id, :comment => { :content => comments(:one).content }
    end
    assert_not_nil assigns(:project)
    assert_not_nil assigns(:comment)
    assert_equal I18n.t("projects.comment.saved"), flash[:notice]
    assert_redirected_to project_path(assigns(:project)) + "#comment_" + assigns(:comment).id.to_s
  end

  test "should not create comment" do
    assert_difference('Comment.count', 0) do
      post :create, :project_id => projects(:one).id, :comment => { :content => nil }
    end
    assert_not_nil assigns(:project)
    assert_not_nil assigns(:comment)
    assert_equal I18n.t("projects.comment.failed"), flash[:error]
    assert_redirected_to project_path(assigns(:project))
  end
end
