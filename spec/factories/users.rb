FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    password { Faker::Internet.password }

    trait :admin do
      admin true
    end
  end
end
