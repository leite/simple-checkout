FactoryBot.define do
  factory :basket_item do
    trait :green_tea do
      code      { 'GR1' }
      name      { 'Green tea' }
      price     { 3.11 }
      quantity  { 1 }
    end
  end
end

