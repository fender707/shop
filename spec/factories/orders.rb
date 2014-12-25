FactoryGirl.define do
  factory :order do
    name    {Faker::Name.name}
    address {Faker::Lorem.sentence(3,false,2)}
    email   {Faker::Internet.email}
  end

end
