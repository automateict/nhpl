require 'test_helper'

class ApplicationInstructionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @application_instruction = application_instructions(:one)
  end

  test "should get index" do
    get application_instructions_url
    assert_response :success
  end

  test "should get new" do
    get new_application_instruction_url
    assert_response :success
  end

  test "should create application_instruction" do
    assert_difference('ApplicationInstruction.count') do
      post application_instructions_url, params: { application_instruction: { content: @application_instruction.content } }
    end

    assert_redirected_to application_instruction_url(ApplicationInstruction.last)
  end

  test "should show application_instruction" do
    get application_instruction_url(@application_instruction)
    assert_response :success
  end

  test "should get edit" do
    get edit_application_instruction_url(@application_instruction)
    assert_response :success
  end

  test "should update application_instruction" do
    patch application_instruction_url(@application_instruction), params: { application_instruction: { content: @application_instruction.content } }
    assert_redirected_to application_instruction_url(@application_instruction)
  end

  test "should destroy application_instruction" do
    assert_difference('ApplicationInstruction.count', -1) do
      delete application_instruction_url(@application_instruction)
    end

    assert_redirected_to application_instructions_url
  end
end
