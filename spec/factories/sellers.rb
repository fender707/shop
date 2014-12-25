FactoryGirl.define do
  factory :seller do
    name     { Faker::Name.name}
    password { Faker::Internet.password}
  end

end
