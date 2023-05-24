# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require 'securerandom'

# Create admin
User.create(email: 'admin@admin.com', password: 'password')
# Create manager
User.create(email: 'manager@manager.com', password: 'password', role: User.roles[:manager])

# Create customers
20.times do
  payment_method = %i[card service cash].sample
  status = %i[new_order send_order done_order canceled_order].sample
  Customer.create(first_name: Faker::Name.name,
                  address: Faker::Address.full_address,
                  phone: Faker::PhoneNumber.phone_number_with_country_code,
                  discount: SecureRandom.base36(16),
                  dont_call: Faker::Boolean.boolean,
                  payment_method:,
                  status:,
                  comment: Faker::Lorem.paragraph)
end

# Create products
20.times do
  p = Product.new(title: Faker::Commerce.product_name,
                  price: Faker::Commerce.price,
                  description: Faker::Lorem.paragraph,
                  body: Faker::Lorem.paragraph,
                  available: Faker::Boolean.boolean,
                  user: User.all.sample)

  if Faker::Boolean.boolean
    p.presentation.attach(io: File.open('./public/apple-touch-icon.png'),
                          filename: Faker::File.file_name(directory_separator: '', ext: 'png'),
                          content_type: 'image/png')
  end

  p.save
end

# Create orders
Customer.all.each do |customer|
  # add products in order
  random_count_orders = rand((1..10))
  
  random_count_orders.times do
    quantity = rand((1..100))
    product = Product.all.sample
  
    Order.create(customer:,
                 product:,
                 quantity:,
                 current_price: product.price)
  end
end