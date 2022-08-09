require 'test_helper'

class SummaryDetailControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tasks = Task.all
    @task = Task.last
  end

  test "should get index" do
    get summary_detail_index_url, params: {sort_column: "created_at", sort_direction: "asc"}
    assert_response :success
  end

  test "should get new" do
    get new_summary_detail_url
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post summary_detail_index_url, params: {task: {title: "spec test", description: "test from openspec"} }
    end

    assert_redirected_to root_url
  end

  test "should show task" do
    get summary_detail_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_summary_detail_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch summary_detail_url(@task), params: { task: {title: "spec test", description: "test from openspec"} }
    assert_redirected_to summary_detail_url(@task)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete summary_detail_url(@task)
    end

    assert_redirected_to root_url
  end
end
