require 'test_helper'

class ApplicantTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @applicant_type = applicant_types(:one)
  end

  test "should get index" do
    get applicant_types_url
    assert_response :success
  end

  test "should get new" do
    get new_applicant_type_url
    assert_response :success
  end

  test "should create applicant_type" do
    assert_difference('ApplicantType.count') do
      post applicant_types_url, params: { applicant_type: { description: @applicant_type.description, name: @applicant_type.name } }
    end

    assert_redirected_to applicant_type_url(ApplicantType.last)
  end

  test "should show applicant_type" do
    get applicant_type_url(@applicant_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_applicant_type_url(@applicant_type)
    assert_response :success
  end

  test "should update applicant_type" do
    patch applicant_type_url(@applicant_type), params: { applicant_type: { description: @applicant_type.description, name: @applicant_type.name } }
    assert_redirected_to applicant_type_url(@applicant_type)
  end

  test "should destroy applicant_type" do
    assert_difference('ApplicantType.count', -1) do
      delete applicant_type_url(@applicant_type)
    end

    assert_redirected_to applicant_types_url
  end
end
