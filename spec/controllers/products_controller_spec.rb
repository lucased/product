require 'spec_helper'

describe ProductsController do

  describe "index" do
    
    before(:each) do
      @products = mock(Array)
    end
    
    it "should fetch a collection of products from the model" do
      Product.should_receive(:all).and_return(@products)
      get :index
      assigns(:products).should be(@products)
    end
    
  end
  
  describe "new" do
    before(:each) do
      @product = mock_model(Product)
    end
    
    it "should render new product form" do
      Product.should_receive(:new).and_return(@product)
      get :new 
    end
    
  end
  
  describe "edit" do
    before(:each) do
      @product = mock_model(Product)
    end
    
    it "should return a product for editing" do
      Product.should_receive(:find).with("1").and_return(@product)
      
      get :edit, :id => 1
    end
    
  end

end
