module Panel
  class AccessControlTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    def setup
      @user_admin = users(:admin)
      @user_manager = users(:manager)
    end

    test "sign in as admin" do
      sign_in @user_admin
      get panel_dashboard_url
      assert_response :success
      assert response.body.include?("admin")
    end

    test "sign in as manager" do
      sign_in @user_manager
      get panel_dashboard_url
      assert_response :success
      assert response.body.include?("manager")
    end

    test "sign out" do
      sign_in @user_admin
      sign_out @user_admin
      get panel_dashboard_url
      assert_redirected_to new_user_session_url
    end
  end
end
