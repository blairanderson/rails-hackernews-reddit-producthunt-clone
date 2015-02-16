FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name(Faker::Name.name) }
    password "password"
    password_confirmation "password"
    trait :admin do
      admin true
    end
  end
end
