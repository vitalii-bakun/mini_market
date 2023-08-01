require "test_helper"

class NotificationsMailerTest < ActionMailer::TestCase
  test "order_was_successfully_created" do
    mail = NotificationsMailer.order_was_successfully_created
    assert_equal "Order was successfully created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
