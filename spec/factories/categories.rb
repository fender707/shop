FactoryGirl.define do
  factory :category do
    name        {Faker::Name.name}
    description {Faker::Lorem.paragraph}
  end

end
