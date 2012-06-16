require 'test_helper'

class FollowupsControllerTest < ActionController::TestCase
  def setup
    @request.session[:id] = users(:one).id
    request.env["HTTP_REFERER"] = root_url
  end

  test "should create followup" do
    assert_difference('Followup.count') do
      post :create, :project_id => projects(:one).id, :followup => { :project_id => followups(:one).project_id, :user_id => followups(:one).user_id }
    end
    assert_not_nil assigns(:followup)
    assert_equal I18n.t("followups.following", :project => projects(:one).title), flash[:notice]
    assert_redirected_to request.env["HTTP_REFERER"]
  end

  test "should destroy followup" do
    assert_difference('Followup.count', -1) do
      delete :destroy, :id => followups(:one).id, :project => { :id => projects(:one) }
    end
    assert_equal I18n.t("followups.unfollowing", :project => projects(:one).title), flash[:notice]
    assert_redirected_to request.env["HTTP_REFERER"]
  end
end
