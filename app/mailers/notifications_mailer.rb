class NotificationsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications_mailer.order_was_successfully_created.subject
  #
  def order_was_successfully_created(customer)
    @customer = customer

    mail to: @customer.market_user.email
  end
end
