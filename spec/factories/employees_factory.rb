
FactoryBot.define do

  factory :department do
    name { "Department A" }
  end

  factory :employee do
    department
    name { "John" }
  end

  factory :pay_category do
    name { "Category C" }
  end
end