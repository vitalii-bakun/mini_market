require "test_helper"

module Admin
  module Admin
    class DashboardControllerTest < BaseTest
      test "should get index" do
        get admin_dashboard_url
        assert_response :success
        assert response.body.include?("admin")
      end
    end
  end
end
