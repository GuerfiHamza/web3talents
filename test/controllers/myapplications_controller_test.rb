require "test_helper"

class MyapplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get myapplications_index_url
    assert_response :success
  end
end
