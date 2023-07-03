require "test_helper"

class Panel::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get panel_users_index_url
    assert_response :success
  end
end
