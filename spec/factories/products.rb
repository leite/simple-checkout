FactoryBot.define do
  factory :product do
    trait :green_tea do
      code  { 'GR1' }
      name  { 'Green tea' }
      price { 3.11 }
    end

    trait :strawberries do
      code  { 'SR1' }
      name  { 'Strawberries' }
      price { 5.0 }
    end

    trait :coffee do
      code  { 'CF1' }
      name  { 'Coffee' }
      price { 11.23 }
    end
  end
end
