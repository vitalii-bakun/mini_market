# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

4.times do
  Customer.create!(first_name: Faker::Name.name, address: Faker::Address.full_address,
                   phone: Faker::PhoneNumber.cell_phone_in_e164, comment: Faker::GreekPhilosophers.quote,
                   dont_call: true, change: 12, discount: 'code here')
end

10.times do
  Customer.create!(first_name: Faker::Name.name, address: Faker::Address.full_address,
                   phone: Faker::PhoneNumber.cell_phone_in_e164, comment: Faker::GreekPhilosophers.quote,
                   dont_call: false, change: 0, discount: '')
end

10.times do
  p = Product.new(title: Faker::Commerce.product_name, price: Faker::Commerce.price,
                  description: Faker::Lorem.paragraph, body: Faker::Lorem.paragraph, available: false)
  p.presentation.attach(io: File.open('./tmp/storage/Original.png'), filename: 'Original.png',
                        content_type: 'image/png')
  p.save
end

10.times do
  Product.create!(title: Faker::Commerce.product_name, price: Faker::Commerce.price,
                  description: Faker::Lorem.paragraph, body: Faker::Lorem.paragraph, available: true)
end

10.times do
  p = Product.new(title: Faker::Commerce.product_name, price: Faker::Commerce.price,
                  description: Faker::Lorem.paragraph, body: Faker::Lorem.paragraph, available: true)
  p.presentation.attach(io: File.open('./tmp/storage/Original.png'), filename: 'Original.png',
                        content_type: 'image/png')
  p.save
end

10.times do
  max = Customer.ids.max
  min = Customer.ids.min
  c = Customer.find(rand((min..max)))

  max = Product.ids.max
  min = Product.ids.min
  p = Product.find(rand((min..max)))
  OrderCustomerProduct.create!(customer: c, product: p, quantity: rand(1..10))
end
