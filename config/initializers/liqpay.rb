Liqpay.configure do |config|
  config.public_key = ENV['liqpay_public_key']
  config.private_key = ENV['liqpay_private_key']
end
