FactoryBot.define do
  factory :card do
    question { "MyString" }
    answer { "MyString" }
    association :category, factory: :category
    association :user, factory: :user
  end
end
