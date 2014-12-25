require 'rails_helper'

RSpec.describe Cart do
  it "has a valid factory" do
    expect(FactoryGirl.build(:cart)). to be_valid
  end
end
