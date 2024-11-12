FactoryBot.define do
  factory :spot do
    association :category
    name { Faker::Company.unique.name }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    place_id { Faker::Number.unique.number(digits: 10).to_s }
    postal_code { Faker::Address.zip }
    address { Faker::Address.full_address }
    phone_number { Faker::PhoneNumber.phone_number }
    opening_hours { "9:00 AM - 5:00 PM" }
    web_site { Faker::Internet.url }
    rating { rand(1.0..5.0).round(1) }
    photo_reference { Faker::Alphanumeric.alphanumeric(number: 10) }
  end
end