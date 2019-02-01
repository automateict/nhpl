require "application_system_test_case"

class ApplicantTypesTest < ApplicationSystemTestCase
  setup do
    @applicant_type = applicant_types(:one)
  end

  test "visiting the index" do
    visit applicant_types_url
    assert_selector "h1", text: "Applicant Types"
  end

  test "creating a Applicant type" do
    visit applicant_types_url
    click_on "New Applicant Type"

    fill_in "Description", with: @applicant_type.description
    fill_in "Name", with: @applicant_type.name
    click_on "Create Applicant type"

    assert_text "Applicant type was successfully created"
    click_on "Back"
  end

  test "updating a Applicant type" do
    visit applicant_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @applicant_type.description
    fill_in "Name", with: @applicant_type.name
    click_on "Update Applicant type"

    assert_text "Applicant type was successfully updated"
    click_on "Back"
  end

  test "destroying a Applicant type" do
    visit applicant_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Applicant type was successfully destroyed"
  end
end
