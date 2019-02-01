require "application_system_test_case"

class PassingMarksTest < ApplicationSystemTestCase
  setup do
    @passing_mark = passing_marks(:one)
  end

  test "visiting the index" do
    visit passing_marks_url
    assert_selector "h1", text: "Passing Marks"
  end

  test "creating a Passing mark" do
    visit passing_marks_url
    click_on "New Passing Mark"

    fill_in "Academic year", with: @passing_mark.academic_year_id
    fill_in "Passing mark", with: @passing_mark.passing_mark
    fill_in "Program", with: @passing_mark.program_id
    click_on "Create Passing mark"

    assert_text "Passing mark was successfully created"
    click_on "Back"
  end

  test "updating a Passing mark" do
    visit passing_marks_url
    click_on "Edit", match: :first

    fill_in "Academic year", with: @passing_mark.academic_year_id
    fill_in "Passing mark", with: @passing_mark.passing_mark
    fill_in "Program", with: @passing_mark.program_id
    click_on "Update Passing mark"

    assert_text "Passing mark was successfully updated"
    click_on "Back"
  end

  test "destroying a Passing mark" do
    visit passing_marks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Passing mark was successfully destroyed"
  end
end
