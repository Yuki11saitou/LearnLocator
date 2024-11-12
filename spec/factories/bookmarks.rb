FactoryBot.define do
  factory :bookmark do
    association :user
    association :spot
  end
end