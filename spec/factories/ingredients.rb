FactoryGirl.define do
  factory :ingredient do
    spell
    name { Faker::Lorem.word }
    quantity { Faker::Number.between(1, 10) }
  end

end
