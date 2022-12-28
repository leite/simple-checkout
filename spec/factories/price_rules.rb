FactoryBot.define do
  factory :price_rule do
    trait :green_tea do
      code                { 'GR1' }
      type                { :one_free }
      min                 { 1 }
      percentage_discount { 0 }
      new_price           { 0 }
    end

    trait :strawberries do
      code                { 'SR1' }
      type                { :discount }
      min                 { 3 }
      percentage_discount { 0 }
      new_price           { 4.5 }
    end

    trait :coffee do
      code                { 'CF1' }
      type                { :discount }
      min                 { 3 }
      percentage_discount { 0.3333 }
      new_price           { 0 }
    end
  end
end

