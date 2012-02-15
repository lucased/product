require 'spec_helper'

describe ProductsController do

  before(:each) do
    @product = mock_model(Product)
  end
  
  def mock_product
    Product.should_receive(:find).with("1").and_return(@product)
  end
  
  def stub_product
    Product.stub!(:find).with("1").and_return(@product)
  end

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
      
    end
    
    it "should render new product form" do
      Product.should_receive(:new).and_return(@product)
      get :new 
    end
    
  end
  
  describe "edit" do
    before(:each) do
      @product = mock_model(Product)
      stub_product
    end
    
    def get_edit
      get :edit, :id => 1
    end
    
    it "should return a product for editing" do
      mock_product
      get_edit
    end
    
    it "assigns a instance variable" do
      get_edit
      assigns[:product].should eql @product
    end
    
    it "render the edit template" do
      get_edit
      response.should render_template("products/edit")
    end
    
  end
  
  describe "create" do
    
    before(:each) do
      @form_data = {
        :title => "some title"
      }
      Product.stub!(:new).with(@form_data.stringify_keys).and_return(@product)
      @product.stub!(:save).and_return(true)
    end
    
    def post_create
      post :create, :product => @form_data
    end

    it "should insatiate product with form data" do
      Product.should_receive(:new).with(@form_data.stringify_keys)
      
      post_create  
    end
    
    it "should set a product instance var" do
      Product.should_receive(:new).with(@form_data.stringify_keys).and_return(@product)
      post_create
      assigns[:product].should eql @product
    end
    
    it "should save the product to the store on success" do
      @product.should_receive(:save).and_return(true)
      post_create
    end
    
    it "should redirect to product index on success" do
      post_create
      response.should redirect_to products_path
    end
    
    it "should set the flash success message" do
      post_create
      flash[:notice].should eq "Product created!"
    end
    
    it "should re render the new template on failure" do
      @product.should_receive(:save).and_return(false)
      post_create
      response.should render_template("products/new")
    end
    
    it "should set the flash success message" do
      @product.should_receive(:save).and_return(false)
      post_create
      flash.now[:alert].should eq "Failed to save!"
    end
    
    
  end

  describe "update" do
    
    before(:each) do
      stub_product
      @product_hash = {"some_key" => "some value"}
      @product.stub!(:update_attributes).with(@product_hash).and_return(true)
    end
    
    def put_update
      put :update, :id => 1, :product => @product_hash
    end
    
    it "should retrieve the product" do
      mock_product
      put_update
    end
    
    it "should update the product" do
      @product.should_receive(:update_attributes).with(@product_hash).and_return(true)
      put_update
      flash[:notice].should eq "Product updated!"
    end
    
    it "does something" do
      @product.should_receive(:update_attributes).with(@product_hash).and_return(false)
      put_update
      flash[:alert].should eq "Failed to update!"      
    end

    
    it "should re render then edit template if save fails" do
      @product.should_receive(:update_attributes).with(@product_hash).and_return(false)
      put_update
      response.should render_template("products/edit")
    end

    
  end
  
  describe "destroy" do
    
    before(:each) do
      Product.stub!(:find).with("1").and_return(@product)
    end
    
    def delete_destroy
      delete :destroy, :id => 1
    end
    
    it "should retrieve the product" do
      Product.should_receive(:find).with("1")
      delete_destroy
    end
    
    it "should assign an instance product variable" do
      Product.should_receive(:find).with("1").and_return(@product)
      delete_destroy
      assigns[:product].should eql @product
    end
    
    it "should delete product with success" do
      @product.should_receive(:destroy).and_return(true)
      delete_destroy
      flash[:notice].should eq "Product deleted."
    end
    
    it "should call delete on product and fail" do
      @product.should_receive(:destroy).and_return(false)
      delete_destroy
      flash[:alert].should eq "Failed to delete product."
    end
  
    it "should redirect to products index" do
      delete_destroy
      response.should redirect_to(products_path)
    end
    
  end
  
end
