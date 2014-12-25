require 'rails_helper'

RSpec.describe Order do
  it "has a valid factory" do
    expect(FactoryGirl.build(:order)). to be_valid
  end

  it {should have_many(:line_items)}
end
