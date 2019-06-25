
puts 'create users'
admin = Admin.create!(user_name: "BinhPham",
                     email: "binh@gmail.com",
                     password: "123456",
                     role: "admin")

user = User.create!(user_name: "NinhPham",
                    email: "ninhpham@gmail.com",
                    password:    "123456",
                    password_confirmation: "123456",
                    full_name: "Georgio Armani",
                    phone_number: "0964980884",
                    address: "Thai Binh"
                    )
100.times do |n|
  user_name  = Faker::Name.name
  email = "ex-#{n+1}@gmail.com"
  password = "123456"
  User.create!(user_name: user_name,
                email: email,
                password: password,
                full_name: "Georgio Armani",
                phone_number: "0964980884",
                address: "Thai Binh"
               )
end
50.times do |n|
  user = User.all.to_a.sample
  full_name = User.pluck(:full_name).to_a.sample
  address = Faker::Address.street_address
  phone_number = Faker::PhoneNumber.phone_number
  status = 0
  Order.create!(user: user,
               full_name: full_name,
               address: address,
               phone_number:  phone_number,
               status: status)
  end 
100.times do |n|
  lname  = Faker::Name.name
  quantity = Faker::Number.between(1, 10)
  price = Faker::Number.between(1, 10000)
  description = Faker::Lorem.sentence(10)
  admin = Admin.first
  Product.create!(name:  lname,
                  quantity: quantity,
                  price: price,
                  description: description,
                  admin: admin)
end
orders = Order.order(:created_at).take(6)
30.times do |n|
  quantity = Faker::Number.between(1, 10)
  product = 1
  orders.each { |order| order.order_items.create!(quantity: quantity, product_id: product) } 
  end

<<<<<<< HEAD
=======
10.times do |n|
  id = [310..350]
  order = Order.first
  productid = Faker::Number.between(1, 100)
  quantity = Faker::Number.between(1, 10)
  order.order_items.create!(id: id,
                           product_id: productid,
                           quantity: quantity)
end

>>>>>>> Order
