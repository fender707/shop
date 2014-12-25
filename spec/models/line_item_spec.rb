require 'rails_helper'

RSpec.describe LineItem do
  it "has a valid factory" do
    expect(FactoryGirl.build(:line_item)). to be_valid
  end

  it {should belong_to(:product)}

  it {should belong_to(:cart)}
  
  it {should belong_to(:order)}
end
