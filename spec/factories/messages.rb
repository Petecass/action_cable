FactoryGirl.define do
  factory :message do
    user
    content { Faker::Lorem.sentences }
  end
end
