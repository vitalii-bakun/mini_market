# Preview all emails at http://localhost:3000/rails/mailers/notifications_mailer
class NotificationsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notifications_mailer/order_was_successfully_created
  def order_was_successfully_created
    NotificationsMailer.order_was_successfully_created
  end

end
