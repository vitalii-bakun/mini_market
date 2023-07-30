module Admin
  class BaseController < ApplicationController
    before_action :authenticate_admin_user!
    load_and_authorize_resource
    alias_method :current_user, :current_admin_user
  end
end
