module Admin
  class DashboardController < BaseController
    skip_load_and_authorize_resource
    before_action :authorize_read_action, only: %i[index]

    def index; end

    def authorize_read_action
      authorize! :read, params[:action].to_sym
    end
  end
end
