FactoryGirl.define do
  factory :spell do
    user
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
  end
end
