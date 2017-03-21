# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories    = [ "Produce", "Flowers", "Meats", "Medicine", "Candy", "Snacks", "Drinks", "Bread" ]
units         = [ "each", "pounds", "ounces" ]
t1            = Time.parse("2017-01-01 00:00:00")
t2            = Time.parse("2017-03-21 00:00:00")

categories.each { |category| Category.create(name: category) }

20.times do
  Product.create(
    name:         Faker::Commerce.product_name.split[2], # one-word product name
    category:     Category.order("RANDOM()").first,      # random category
    unit:         units.sample
  )
  Customer.create(
    first_name:   Faker::Internet.user_name,
    last_name:    Faker::Internet.user_name,
    email:        Faker::Internet.email
  )
end

50.times do
  order = Order.create(
    customer:     Customer.order("RANDOM()").first,
    created_at:   rand(t1..t2)
  )
  5.times do
    OrderProduct.create(
      order:        order,
      product:      Product.order("RANDOM()").first,
      quantity:     rand(1..10),
      created_at:   order.created_at
    )
  end
end
