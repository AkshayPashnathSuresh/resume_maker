require "test_helper"

class AddressInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get address_info_new_url
    assert_response :success
  end

  test "should get create" do
    get address_info_create_url
    assert_response :success
  end
end
