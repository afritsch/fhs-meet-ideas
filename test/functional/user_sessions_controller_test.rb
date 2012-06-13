require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  def setup
    @request.session[:id] = users(:one).id
  end

  test "should get new when not logged in" do
    @request.session[:id] = nil
    get :new
    assert_response :success
  end

  test "should get new when logged in" do
    get :new
    assert_equal I18n.t("auth.already_logged_in"), flash[:error]
    assert_redirected_to root_url
  end
end
