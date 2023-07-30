module Admin
  module Admin
    class BaseTest < ActionDispatch::IntegrationTest
      include Devise::Test::IntegrationHelpers

      setup do
        @admin = users(:admin)
        sign_in @admin
      end
    end
  end
end
