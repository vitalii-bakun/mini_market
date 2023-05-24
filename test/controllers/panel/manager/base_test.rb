module Panel
  module Manager
    class BaseTest < ActionDispatch::IntegrationTest
      include Devise::Test::IntegrationHelpers

      setup do
        @manager = users(:manager)
        sign_in @manager
      end
    end
  end
end
