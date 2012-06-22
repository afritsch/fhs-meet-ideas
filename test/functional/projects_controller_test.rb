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
    assert_not_nil assigns(:project)
    assert_not_nil assigns(:roles)
    assert_not_nil assigns(:pictures)
    assert_not_nil assigns(:appointments)
    assert_not_nil assigns(:comments)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:project)
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, :project => { :title => projects(:one).title, :status => projects(:one).status, :description => projects(:one).description }
    end
    assert_not_nil assigns(:project)
    assert_equal I18n.t("projects.new.saved") +  " <a href=\"/versions/1/revert\" data-method=\"post\" rel=\"nofollow\">#{I18n.t("paper_trail.undo")}</a>", flash[:notice]
    assert_redirected_to project_path(assigns(:project))
  end

  test "should get edit" do
    get :edit, :id => projects(:one).id
    assert_response :success
    assert_not_nil assigns(:project)
  end

  test "should update project" do
    put :update, :id => projects(:one).id, :project => { :title => projects(:two).title, :status => projects(:two).status, :description => projects(:two).description }
    assert_not_nil assigns(:project)
    assert_equal I18n.t("projects.edit.updated") + " <a href=\"/versions/1/revert\" data-method=\"post\" rel=\"nofollow\">#{I18n.t("paper_trail.undo")}</a>", flash[:notice]
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, :id => projects(:one).id
    end
    assert_not_nil assigns(:project)
    assert_equal I18n.t("projects.show.destroyed"), flash[:notice]
    assert_redirected_to projects_path
  end
end
