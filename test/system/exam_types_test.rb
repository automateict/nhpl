require "application_system_test_case"

class ExamTypesTest < ApplicationSystemTestCase
  setup do
    @exam_type = exam_types(:one)
  end

  test "visiting the index" do
    visit exam_types_url
    assert_selector "h1", text: "Exam Types"
  end

  test "creating a Exam type" do
    visit exam_types_url
    click_on "New Exam Type"

    fill_in "Description", with: @exam_type.description
    fill_in "Name", with: @exam_type.name
    click_on "Create Exam type"

    assert_text "Exam type was successfully created"
    click_on "Back"
  end

  test "updating a Exam type" do
    visit exam_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @exam_type.description
    fill_in "Name", with: @exam_type.name
    click_on "Update Exam type"

    assert_text "Exam type was successfully updated"
    click_on "Back"
  end

  test "destroying a Exam type" do
    visit exam_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exam type was successfully destroyed"
  end
end
