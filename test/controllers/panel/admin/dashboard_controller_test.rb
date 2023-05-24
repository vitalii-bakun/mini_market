require "test_helper"

module Panel
  module Admin
    class DashboardControllerTest < BaseTest
      test "should get index" do
        get panel_dashboard_url
        assert_response :success
        assert response.body.include?("admin")
      end
    end
  end
end
