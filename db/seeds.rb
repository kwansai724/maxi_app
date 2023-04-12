# User作成
User.create!(
  name: "たかひろ",
  email: ENV.fetch("MY_EMAIL"),
  password: ENV.fetch("MY_PASSWORD"), 
  password_confirmation: ENV.fetch("MY_PASSWORD")
)
puts "User作成"