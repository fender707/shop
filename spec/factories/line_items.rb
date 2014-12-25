FactoryGirl.define do
  factory :line_item do
    association :product
    association :cart
    association :order 
  end

end
