50.times do |n|
  lname  = Faker::Name.name
  quantity = 1
  price = 3
  description = Faker::Lorem.sentence(10)
  admin = Admin.first
  Product.create!(name:  lname,
               quantity: quantity,
               price: price,
               description: description,
               admin: admin)
end

product = Product.all