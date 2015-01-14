require 'rails_helper'

RSpec.describe Product do
  it "has a valid factory" do
    expect(FactoryGirl.build(:product)). to be_valid
  end

  it {should belong_to(:category)}

  it {should have_many(:line_items)}

  it {should have_many(:orders)}
  
  it {should ensure_length_of(:title).is_at_least(3). is_at_most(120)}

  it {should_not allow_value('').for(:title)}

  #it {should validate_presence_of(:category)}
  
  it {should validate_presence_of(:title)}

  it {should validate_presence_of(:count)}

  it {should validate_presence_of(:price)}
end
