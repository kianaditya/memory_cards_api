FactoryBot.define do
  factory :card do
    question { "MyString" }
    answer { "MyString" }
    association :category, factory: :category
  end
end
