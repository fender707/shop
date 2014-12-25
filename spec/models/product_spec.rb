require 'rails_helper'

RSpec.describe Product do
  it "has a valid factory" do
    expect(FactoryGirl.build(:product)). to be_valid
  end

  it {should belong_to(:category)}

  it {should have_many(:line_items)}

  it {should have_many(:orders)}
end
