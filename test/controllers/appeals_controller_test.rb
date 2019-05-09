require 'test_helper'

class AppealsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appeal = appeals(:one)
  end

  test "should get index" do
    get appeals_url
    assert_response :success
  end

  test "should get new" do
    get new_appeal_url
    assert_response :success
  end

  test "should create appeal" do
    assert_difference('Appeal.count') do
      post appeals_url, params: { appeal: { applicant_id: @appeal.applicant_id, body: @appeal.body, status: @appeal.status, subject: @appeal.subject } }
    end

    assert_redirected_to appeal_url(Appeal.last)
  end

  test "should show appeal" do
    get appeal_url(@appeal)
    assert_response :success
  end

  test "should get edit" do
    get edit_appeal_url(@appeal)
    assert_response :success
  end

  test "should update appeal" do
    patch appeal_url(@appeal), params: { appeal: { applicant_id: @appeal.applicant_id, body: @appeal.body, status: @appeal.status, subject: @appeal.subject } }
    assert_redirected_to appeal_url(@appeal)
  end

  test "should destroy appeal" do
    assert_difference('Appeal.count', -1) do
      delete appeal_url(@appeal)
    end

    assert_redirected_to appeals_url
  end
end
