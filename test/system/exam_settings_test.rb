require "application_system_test_case"

class ExamSettingsTest < ApplicationSystemTestCase
  setup do
    @exam_setting = exam_settings(:one)
  end

  test "visiting the index" do
    visit exam_settings_url
    assert_selector "h1", text: "Exam Settings"
  end

  test "creating a Exam setting" do
    visit exam_settings_url
    click_on "New Exam Setting"

    fill_in "Academic year", with: @exam_setting.academic_year_id
    fill_in "Passing mark", with: @exam_setting.passing_mark
    fill_in "Program", with: @exam_setting.program_id
    click_on "Create Exam setting"

    assert_text "Exam setting was successfully created"
    click_on "Back"
  end

  test "updating a Exam setting" do
    visit exam_settings_url
    click_on "Edit", match: :first

    fill_in "Academic year", with: @exam_setting.academic_year_id
    fill_in "Passing mark", with: @exam_setting.passing_mark
    fill_in "Program", with: @exam_setting.program_id
    click_on "Update Exam setting"

    assert_text "Exam setting was successfully updated"
    click_on "Back"
  end

  test "destroying a Exam setting" do
    visit exam_settings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exam setting was successfully destroyed"
  end
end
