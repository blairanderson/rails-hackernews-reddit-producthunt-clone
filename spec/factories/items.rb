FactoryGirl.define do
  factory :item do
    user
    title {Faker::Company.bs[0..250]}
    url {Faker::Internet.url}
  end
end
