require "application_system_test_case"

module Admin
  class BaseSystemTest < ApplicationSystemTestCase
    include Devise::Test::IntegrationHelpers
    def setup
      sign_in users(:admin)
    end
  end
end
