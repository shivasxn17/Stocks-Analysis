require 'test_helper'

class TrainingDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get emp_id:integer" do
    get training_details_emp_id:integer_url
    assert_response :success
  end

  test "should get training_name" do
    get training_details_training_name_url
    assert_response :success
  end

  test "should get training_id:integer" do
    get training_details_training_id:integer_url
    assert_response :success
  end

  test "should get completion_date:date" do
    get training_details_completion_date:date_url
    assert_response :success
  end

end
