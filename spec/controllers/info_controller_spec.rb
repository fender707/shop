require 'rails_helper'

RSpec.describe InfoController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      get :authenticate!
      expect(response).to have_http_status(:success)
    end

  end

end
