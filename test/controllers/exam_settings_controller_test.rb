require 'test_helper'

class ExamSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exam_setting = exam_settings(:one)
  end

  test "should get index" do
    get exam_settings_url
    assert_response :success
  end

  test "should get new" do
    get new_exam_setting_url
    assert_response :success
  end

  test "should create exam_setting" do
    assert_difference('ExamSetting.count') do
      post exam_settings_url, params: { exam_setting: { academic_year_id: @exam_setting.academic_year_id, passing_mark: @exam_setting.passing_mark, program_id: @exam_setting.program_id } }
    end

    assert_redirected_to exam_setting_url(ExamSetting.last)
  end

  test "should show exam_setting" do
    get exam_setting_url(@exam_setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_exam_setting_url(@exam_setting)
    assert_response :success
  end

  test "should update exam_setting" do
    patch exam_setting_url(@exam_setting), params: { exam_setting: { academic_year_id: @exam_setting.academic_year_id, passing_mark: @exam_setting.passing_mark, program_id: @exam_setting.program_id } }
    assert_redirected_to exam_setting_url(@exam_setting)
  end

  test "should destroy exam_setting" do
    assert_difference('ExamSetting.count', -1) do
      delete exam_setting_url(@exam_setting)
    end

    assert_redirected_to exam_settings_url
  end
end
