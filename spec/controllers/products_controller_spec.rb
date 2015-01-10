require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do
  
  context "when user not logged in" do
    describe "GET #index" do
      it "redirects to login page" do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context "when user logged in" do
    let(:user) { FactoryGirl.create(:user)}
    subject { FactoryGirl.create(:product)}
    
    before do
      sign_in user
    end
  
  describe "GET #index" do
    it "assigns the requested product to new product" do
      get :index
      expect(assigns(:products)).to eq([subject])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end


  describe "GET #new" do
    it "assigns the requested product to new product" do
      get :new
      expect(assigns(:product)).to be_new_record
    end
   
    it "renders the :new view" do
      get :new 
      expect(response).to render_template :new
    end
  end

  describe "GET #show" do
    it "assigns the request product to subject" do
      get :show, id: subject
      expect(assigns(:product)).to eq(subject)
    end

    it "renders the :show view" do
      get :show, id: subject
      expect(response).to render_template :show
    end
  end
 
    describe "GET #edit" do
    it "assigns the request product to subject" do
      get :edit, id: subject
      expect(assigns(:product)).to eq(subject)
    end

    it "renders the :edit view" do
      get :edit, id: subject
      expect(response).to render_template :edit
    end
  end

  describe "DELETE #destroy" do
     before(:each) { @product = FactoryGirl.create :product}

    it "deletes the product" do
      expect{
        delete :destroy, id: @product
      }.to change(Product, :count).by(-1)
    end

    it "redirects to index" do
      delete :destroy, id: @product
      expect(response).to redirect_to products_path 
    end
  end

  end
end
