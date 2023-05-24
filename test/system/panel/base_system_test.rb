require "application_system_test_case"

module Panel
  class BaseSystemTest < ApplicationSystemTestCase
    include Devise::Test::IntegrationHelpers
    def setup
      sign_in users(:admin)
    end
  end
end
