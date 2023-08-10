module Admin
  class DashboardController < BaseController
    skip_load_and_authorize_resource only: %i[index]

    def index
      authorize! :read, :dashboard
    end
  end
end
