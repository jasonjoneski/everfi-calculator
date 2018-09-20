require 'test_helper'

class CalculatorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get calculator_index_url
    assert_response :success
  end

  test "should do calculations" do
    post calculator_index_url, params: {formula: "2+2"}
    assert_response :success

    assert response.body.index("<strong>Result:</strong> 4")
  end

  test "should handle bad formulas" do
    post calculator_index_url, params: {formula: "a+b"}
    assert_response :success
    assert response.body.index("<strong>Result:</strong> a+b is not a valid calculate string.")
  end

end
