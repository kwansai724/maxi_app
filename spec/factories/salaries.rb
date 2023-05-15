FactoryBot.define do
  factory :salary do
    amount_of_sales { 1_000_000 }
    source_of_income { 'テックビズ' }
    year { '2023年' }
    monthly { '7月度' }
  end
end
