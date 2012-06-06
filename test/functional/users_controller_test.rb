require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @request.session[:id] = users(:one).id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should show user details" do
    get :show, :id => users(:one).id
    assert_response :success
  end

end
