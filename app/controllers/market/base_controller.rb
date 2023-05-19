module Market
  class BaseController < ApplicationController
    protected

    def session_products
      session[:products] ||= {}
    end

    def session_products_empty?
      session_products.blank?
    end
  end
end
