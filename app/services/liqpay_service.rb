module LiqpayService
  class << self
    DEFAULT_PARAMS = {
      action: 'pay',
      amount: "1",
      currency: 'USD',
      paytypes: 'card',
      description: 'description text',
      order_id: 'order_id_1',
      version: '3',
      result_url: 'http://127.0.0.1:3000/',
      language: 'en'
    }.freeze

    # @param [String] action
    # @param [String] amount
    # @param [String] currency
    # @param [String] description
    # @param [String] order_id
    # @param [String] version
    # @param [String] result_url
    # @param [String] language
    # @return [String] liqpay html form
    def generate_form(**params)
      liqpay = ::Liqpay.new
      data = DEFAULT_PARAMS.merge(params)
      liqpay.cnb_form(data)
    end

    def order_status(order_id)
      liqpay = ::Liqpay.new
      liqpay.api("request", {
                   action: "status",
                   version: "3",
                   order_id:
                 })
    end
  end
end
