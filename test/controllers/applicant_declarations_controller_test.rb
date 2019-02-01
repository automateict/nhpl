require 'test_helper'

class ApplicantDeclarationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @applicant_declaration = applicant_declarations(:one)
  end

  test "should get index" do
    get applicant_declarations_url
    assert_response :success
  end

  test "should get new" do
    get new_applicant_declaration_url
    assert_response :success
  end

  test "should create applicant_declaration" do
    assert_difference('ApplicantDeclaration.count') do
      post applicant_declarations_url, params: { applicant_declaration: { applicant_id: @applicant_declaration.applicant_id } }
    end

    assert_redirected_to applicant_declaration_url(ApplicantDeclaration.last)
  end

  test "should show applicant_declaration" do
    get applicant_declaration_url(@applicant_declaration)
    assert_response :success
  end

  test "should get edit" do
    get edit_applicant_declaration_url(@applicant_declaration)
    assert_response :success
  end

  test "should update applicant_declaration" do
    patch applicant_declaration_url(@applicant_declaration), params: { applicant_declaration: { applicant_id: @applicant_declaration.applicant_id } }
    assert_redirected_to applicant_declaration_url(@applicant_declaration)
  end

  test "should destroy applicant_declaration" do
    assert_difference('ApplicantDeclaration.count', -1) do
      delete applicant_declaration_url(@applicant_declaration)
    end

    assert_redirected_to applicant_declarations_url
  end
end
