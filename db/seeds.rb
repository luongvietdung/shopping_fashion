#puts 'create users'
user = User.create!(user_name: "NinhPham",
             email: "ninhpham@gmail.com",
             password:    "123456",
             password_confirmation: "123456",
             full_name: "Pham Ngoc Ninh",
             phone_number: "0964980884",
             address: "Thai Binh"
            )

 50.times do |n|
 user_name  = Faker::Name.name
  email = "ex-#{n+1}@gmail.com"
 password = "123456"
 User.create!(user_name:  user_name,
              email: email,
              password: password,
              full_name: "Pham Ngoc Ninh",
              phone_number: "0964980884",
              address: "Thai Binh"
              )
 end

admin = Admin.create!(user_name: "BinhPham",
                      email: "binh@gmail.com",
                      password: "123456",
                      role: "admin")
