require "test_helper"

class CvUserAddressControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get cv_user_address_create_url
    assert_response :success
  end
end
