require 'rails_helper'

RSpec.describe Seller do
  it "has a valid factory" do
    expect(FactoryGirl.build(:seller)). to be_valid
  end
end
