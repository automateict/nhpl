require 'test_helper'

class PassingMarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @passing_mark = passing_marks(:one)
  end

  test "should get index" do
    get passing_marks_url
    assert_response :success
  end

  test "should get new" do
    get new_passing_mark_url
    assert_response :success
  end

  test "should create passing_mark" do
    assert_difference('PassingMark.count') do
      post passing_marks_url, params: { passing_mark: { academic_year_id: @passing_mark.academic_year_id, passing_mark: @passing_mark.passing_mark, program_id: @passing_mark.program_id } }
    end

    assert_redirected_to passing_mark_url(PassingMark.last)
  end

  test "should show passing_mark" do
    get passing_mark_url(@passing_mark)
    assert_response :success
  end

  test "should get edit" do
    get edit_passing_mark_url(@passing_mark)
    assert_response :success
  end

  test "should update passing_mark" do
    patch passing_mark_url(@passing_mark), params: { passing_mark: { academic_year_id: @passing_mark.academic_year_id, passing_mark: @passing_mark.passing_mark, program_id: @passing_mark.program_id } }
    assert_redirected_to passing_mark_url(@passing_mark)
  end

  test "should destroy passing_mark" do
    assert_difference('PassingMark.count', -1) do
      delete passing_mark_url(@passing_mark)
    end

    assert_redirected_to passing_marks_url
  end
end
