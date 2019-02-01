require 'test_helper'

class ApplicantServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @applicant_service = applicant_services(:one)
  end

  test "should get index" do
    get applicant_services_url
    assert_response :success
  end

  test "should get new" do
    get new_applicant_service_url
    assert_response :success
  end

  test "should create applicant_service" do
    assert_difference('ApplicantService.count') do
      post applicant_services_url, params: { applicant_service: { applicant_id: @applicant_service.applicant_id, service: @applicant_service.service } }
    end

    assert_redirected_to applicant_service_url(ApplicantService.last)
  end

  test "should show applicant_service" do
    get applicant_service_url(@applicant_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_applicant_service_url(@applicant_service)
    assert_response :success
  end

  test "should update applicant_service" do
    patch applicant_service_url(@applicant_service), params: { applicant_service: { applicant_id: @applicant_service.applicant_id, service: @applicant_service.service } }
    assert_redirected_to applicant_service_url(@applicant_service)
  end

  test "should destroy applicant_service" do
    assert_difference('ApplicantService.count', -1) do
      delete applicant_service_url(@applicant_service)
    end

    assert_redirected_to applicant_services_url
  end
end
