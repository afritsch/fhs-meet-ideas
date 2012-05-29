require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  def setup
    @request.session[:id] = users(:one).id
  end
  
  test "should go to login page when not logged in" do
    @request.session[:id] = nil
    get :new
    assert_redirected_to login_path
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end
  
  test "should show project" do
    get :show, :id => projects(:one).id
    assert_response :success
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should create project" do
    assert_difference('Project.count') do
      post :create, :project => { :title => projects(:one).title, :status => projects(:one).status, :description => projects(:one).description }
    end
    assert_redirected_to project_path(assigns(:project))
    assert_equal I18n.t("projects.new.saved"), flash[:notice]
  end
  
  test "should get edit" do
    get :edit, :id => projects(:one).id
    assert_response :success
  end
  
  test "should update project" do
    put :update, :id => projects(:one).id, :project => { :title => projects(:two).title, :status => projects(:two).status, :description => projects(:two).description }
    assert_redirected_to project_path(assigns(:project))
    assert_equal I18n.t("projects.edit.updated"), flash[:notice]
  end
  
  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, :id => projects(:one).id
    end
    assert_redirected_to projects_path
    assert_equal I18n.t("projects.show.destroyed"), flash[:notice]
  end
end
