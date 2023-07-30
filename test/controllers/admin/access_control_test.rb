module Admin
  class AccessControlTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    def setup
      @admin_user_admin = users(:admin)
      @admin_user_manager = users(:manager)
    end

    test "sign in as admin" do
      sign_in @admin_user_admin
      get admin_dashboard_url
      assert_response :success
      assert response.body.include?("admin")
    end

    test "sign in as manager" do
      sign_in @admin_user_manager
      get admin_dashboard_url
      assert_response :success
      assert response.body.include?("manager")
    end

    test "sign out" do
      sign_in @admin_user_admin
      sign_out @admin_user_admin
      get admin_dashboard_url
      assert_redirected_to new_user_session_url
    end
  end
end
