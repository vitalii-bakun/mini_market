class OrderStatusJob < ApplicationJob
  queue_as :default

  def perform(customer)
    order_info = LiqpayService.get_order_status(customer.uuid)

    return unless order_info["status"] == "success"

    customer.update(payment_status: true)
  end
end
