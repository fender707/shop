FactoryGirl.define do
  factory :product do
    title       {Faker::Lorem.characters(rand(3..120))}
    description {Faker::Lorem.sentence(rand(4..6),false,6)}
    count       {Faker::Number.positive(1,500)}
    price       {Faker::Number.positive(1.00,5000.00)}
    association :category, factory: :category
  end

end
