require 'test_helper'

class ExamTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exam_type = exam_types(:one)
  end

  test "should get index" do
    get exam_types_url
    assert_response :success
  end

  test "should get new" do
    get new_exam_type_url
    assert_response :success
  end

  test "should create exam_type" do
    assert_difference('ExamType.count') do
      post exam_types_url, params: { exam_type: { description: @exam_type.description, name: @exam_type.name } }
    end

    assert_redirected_to exam_type_url(ExamType.last)
  end

  test "should show exam_type" do
    get exam_type_url(@exam_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_exam_type_url(@exam_type)
    assert_response :success
  end

  test "should update exam_type" do
    patch exam_type_url(@exam_type), params: { exam_type: { description: @exam_type.description, name: @exam_type.name } }
    assert_redirected_to exam_type_url(@exam_type)
  end

  test "should destroy exam_type" do
    assert_difference('ExamType.count', -1) do
      delete exam_type_url(@exam_type)
    end

    assert_redirected_to exam_types_url
  end
end
