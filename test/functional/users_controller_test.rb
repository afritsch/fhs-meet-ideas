require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @request.session[:id] = users(:one).id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users_with_projects)
    assert_not_nil assigns(:users_without_projects)
  end

  test "should show user details" do
    get :show, :id => users(:one).id
    assert_response :success
    assert_not_nil assigns(:user)
    assert_not_nil assigns(:projects)
  end

end
