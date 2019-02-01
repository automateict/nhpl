require 'test_helper'

class ApplicantExamHubsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @applicant_exam_hub = applicant_exam_hubs(:one)
  end

  test "should get index" do
    get applicant_exam_hubs_url
    assert_response :success
  end

  test "should get new" do
    get new_applicant_exam_hub_url
    assert_response :success
  end

  test "should create applicant_exam_hub" do
    assert_difference('ApplicantExamHub.count') do
      post applicant_exam_hubs_url, params: { applicant_exam_hub: { applicant_id: @applicant_exam_hub.applicant_id, exam_hub_id: @applicant_exam_hub.exam_hub_id } }
    end

    assert_redirected_to applicant_exam_hub_url(ApplicantExamHub.last)
  end

  test "should show applicant_exam_hub" do
    get applicant_exam_hub_url(@applicant_exam_hub)
    assert_response :success
  end

  test "should get edit" do
    get edit_applicant_exam_hub_url(@applicant_exam_hub)
    assert_response :success
  end

  test "should update applicant_exam_hub" do
    patch applicant_exam_hub_url(@applicant_exam_hub), params: { applicant_exam_hub: { applicant_id: @applicant_exam_hub.applicant_id, exam_hub_id: @applicant_exam_hub.exam_hub_id } }
    assert_redirected_to applicant_exam_hub_url(@applicant_exam_hub)
  end

  test "should destroy applicant_exam_hub" do
    assert_difference('ApplicantExamHub.count', -1) do
      delete applicant_exam_hub_url(@applicant_exam_hub)
    end

    assert_redirected_to applicant_exam_hubs_url
  end
end
