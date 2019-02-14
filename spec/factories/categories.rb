FactoryBot.define do
  factory :category do
    name { "MyString" }
    association :user, factory: :user
  end
end
