require 'rails_helper'

RSpec.describe Category do
  it "has a valid factory" do
    expect(FactoryGirl.build(:category)). to be_valid
  end

  it {should have_many(:products)}
end
