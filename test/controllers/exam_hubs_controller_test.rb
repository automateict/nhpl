require 'test_helper'

class ExamHubsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exam_hub = exam_hubs(:one)
  end

  test "should get index" do
    get exam_hubs_url
    assert_response :success
  end

  test "should get new" do
    get new_exam_hub_url
    assert_response :success
  end

  test "should create exam_hub" do
    assert_difference('ExamHub.count') do
      post exam_hubs_url, params: { exam_hub: { city: @exam_hub.city, name: @exam_hub.name, region_id: @exam_hub.region_id } }
    end

    assert_redirected_to exam_hub_url(ExamHub.last)
  end

  test "should show exam_hub" do
    get exam_hub_url(@exam_hub)
    assert_response :success
  end

  test "should get edit" do
    get edit_exam_hub_url(@exam_hub)
    assert_response :success
  end

  test "should update exam_hub" do
    patch exam_hub_url(@exam_hub), params: { exam_hub: { city: @exam_hub.city, name: @exam_hub.name, region_id: @exam_hub.region_id } }
    assert_redirected_to exam_hub_url(@exam_hub)
  end

  test "should destroy exam_hub" do
    assert_difference('ExamHub.count', -1) do
      delete exam_hub_url(@exam_hub)
    end

    assert_redirected_to exam_hubs_url
  end
end
