require "application_system_test_case"

class LicenseResultsTest < ApplicationSystemTestCase
  setup do
    @license_result = license_results(:one)
  end

  test "visiting the index" do
    visit license_results_url
    assert_selector "h1", text: "License Results"
  end

  test "creating a License result" do
    visit license_results_url
    click_on "New License Result"

    fill_in "Applicant", with: @license_result.applicant_id
    fill_in "Result", with: @license_result.result
    click_on "Create License result"

    assert_text "License result was successfully created"
    click_on "Back"
  end

  test "updating a License result" do
    visit license_results_url
    click_on "Edit", match: :first

    fill_in "Applicant", with: @license_result.applicant_id
    fill_in "Result", with: @license_result.result
    click_on "Update License result"

    assert_text "License result was successfully updated"
    click_on "Back"
  end

  test "destroying a License result" do
    visit license_results_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "License result was successfully destroyed"
  end
end
