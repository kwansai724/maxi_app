require "csv"

# User作成
User.create!(
  name: "たかひろ",
  email: ENV.fetch("MY_EMAIL"),
  password: ENV.fetch("MY_PASSWORD"), 
  password_confirmation: ENV.fetch("MY_PASSWORD")
)
puts "User作成"

# GoingOut作成
CSV.foreach('db/csv/going_outs.csv', headers: true) do |row|
  GoingOut.create(
    going_out_day: row['going_out_day'],
    place: row['place'],
    is_stay: row['is_stay'],
    remarks: row['remarks']
  )
end
puts "GoingOut作成"

# Salary作成
CSV.foreach('db/csv/salaries.csv', headers: true) do |row|
  Salary.create(
    amount_of_sales: row['amount_of_sales'],
    source_of_income: row['source_of_income'],
    year: row['year'],
    monthly: row['monthly']
  )
end
puts "Salary作成"
