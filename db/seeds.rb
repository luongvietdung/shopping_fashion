 puts 'create users'
 user = User.create!(user_name: "NinhPham",
                     email: "ninhpham@gmail.com",
                     password:    "123456",
                     password_confirmation: "123456",
                     full_name: "Georgio Armani",
                     phone_number: "0964980884",
                     address: "Thai Binh"
                    )

50.times do |n|
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


admin = Admin.create!(user_name: "BinhPham",
                      email: "binh@gmail.com",
                      password: "123456",
                      role: "admin")
