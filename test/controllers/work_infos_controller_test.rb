require "test_helper"

class WorkInfosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get work_info_new_url
    assert_response :success
  end
end
