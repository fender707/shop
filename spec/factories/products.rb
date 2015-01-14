FactoryGirl.define do
  factory :product do
    title       {Faker::Lorem.characters(rand(6..15))}
    description {Faker::Lorem.sentence(rand(4..6),false,6)}
    count       {Faker::Number.positive(1,500)}
    price       {Faker::Number.positive(1.00,5000.00)}
    association :category 
  end

end
