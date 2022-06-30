FactoryBot.define do
  factory :pay do
    department { nil }
    employee { nil }
    year { 1 }
    month { 1 }
    sum { 1.5 }
  end
end
