FactoryBot.define do
  factory :like do
    association :user
    association :review
  end
end