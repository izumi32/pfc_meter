FactoryBot.define do
  factory :food do
    food_name "卵"
    protein 7.4
    fat 6.2
    carbohydrate 0.2
    date DateTime.now
    unit 100
    association :user
  end
end
