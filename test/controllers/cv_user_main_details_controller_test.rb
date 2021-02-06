require "test_helper"

class CvUserMainDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get cv_user_main_details_create_url
    assert_response :success
  end

  test "should get update" do
    get cv_user_main_details_update_url
    assert_response :success
  end
end
