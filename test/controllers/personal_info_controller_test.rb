require "test_helper"

class PersonalInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get personal_info_new_url
    assert_response :success
  end

  test "should get create" do
    get personal_info_create_url
    assert_response :success
  end
end
