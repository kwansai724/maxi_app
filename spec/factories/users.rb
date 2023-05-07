FactoryBot.define do
  factory :user do
    name { 'たかひろ' }
    email { 'takahiro_test@example.com' }
    password_digest { 'password' }
  end
end
