module Market
  class BaseController < ApplicationController
    before_action :authenticate_market_user!
    layout 'market/application'
  end
end
