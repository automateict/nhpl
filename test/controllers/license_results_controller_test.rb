require 'test_helper'

class LicenseResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @license_result = license_results(:one)
  end

  test "should get index" do
    get license_results_url
    assert_response :success
  end

  test "should get new" do
    get new_license_result_url
    assert_response :success
  end

  test "should create license_result" do
    assert_difference('LicenseResult.count') do
      post license_results_url, params: { license_result: { applicant_id: @license_result.applicant_id, result: @license_result.result } }
    end

    assert_redirected_to license_result_url(LicenseResult.last)
  end

  test "should show license_result" do
    get license_result_url(@license_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_license_result_url(@license_result)
    assert_response :success
  end

  test "should update license_result" do
    patch license_result_url(@license_result), params: { license_result: { applicant_id: @license_result.applicant_id, result: @license_result.result } }
    assert_redirected_to license_result_url(@license_result)
  end

  test "should destroy license_result" do
    assert_difference('LicenseResult.count', -1) do
      delete license_result_url(@license_result)
    end

    assert_redirected_to license_results_url
  end
end
