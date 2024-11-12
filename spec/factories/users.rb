FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
  end
end