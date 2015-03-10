FactoryGirl.define do
  factory :item_comment do
    item
    user
    content {Faker::Company.bs[0..250]}
  end
end
