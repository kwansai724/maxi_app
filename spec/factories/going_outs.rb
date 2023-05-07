FactoryBot.define do
  factory :going_out do
    going_out_day { Faker::Date.between(from: '2020-06-27', to: '2023-06-27') }
    place { Faker::Address.city }
    is_stay { Faker::Boolean.boolean }
    remarks { Faker::Lorem.sentence }
  end
end
