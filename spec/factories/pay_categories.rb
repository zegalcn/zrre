FactoryBot.define do
  factory :pay_category do
    parent { nil }
    name { "MyString" }
    mode { 1 }
    description { "MyText" }
  end
end
