#---
# Excerpted from "Rails Test Prescriptions",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/nrtest for more book information.
#---
require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  
  setup :login_as_one
  
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, :project => @project.attributes
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, :id => @project.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @project.to_param
    assert_response :success
  end

  test "should update project" do
    put :update, :id => @project.to_param, :project => @project.attributes
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, :id => @project.to_param
    end

    assert_redirected_to projects_path
  end
  
  test "project timeline index should be sorted correctly" do
    set_current_project(:huddle)
    get :show, :id => projects(:huddle).id
    expected_keys = assigns(:reports).keys.sort.map{ |d| d.to_s(:db) } 
    assert_equal(["2009-01-06", "2009-01-07"], expected_keys) 
    assert_equal(   
        [status_reports(:one_tue).id, status_reports(:two_tue).id],
        assigns(:reports)[Date.parse("2009-01-06")].map(&:id))  
  end
  
  test "index should display project timeline" do
    set_current_project(:huddle)
    get :show, :id => projects(:huddle).id
    assert_select "div[id *= day]", :count => 2
    assert_select "div#2009-01-06_day" do
      assert_select "div[id *= report]", :count => 2
      assert_select "div#?", dom_id(status_reports(:one_tue))
      assert_select "div#?", dom_id(status_reports(:two_tue))
    end
    assert_select "div#2009-01-07_day" do
      assert_select "div[id *= report]", :count => 2
      assert_select "div#?", dom_id(status_reports(:one_wed))
      assert_select "div#?", dom_id(status_reports(:two_wed))
    end
  end
  
    test "should update with users" do
      set_current_project(:huddle)
      put :update, :id => projects(:huddle).id, 
          :users_in_project => [users(:quentin).id]
      huddle = Project.find_by_name("Huddle")
      assert_equal [users(:quentin).id], huddle.user_ids
    end
  
end
