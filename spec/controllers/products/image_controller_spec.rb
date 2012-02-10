require 'spec_helper'

describe Products::ImageController do
  
  describe "destroy" do
    before(:each) do
      @product = mock_model(Product)
      Product.stub!(:find).with("1").and_return(@product)
      @product.stub!(:image=).with(nil)
      @product.stub!(:save).and_return(true)
    end
    
    def delete_destroy
      delete :destroy, :product_id => 1
    end
    
    it "should retrieve the product" do
      Product.should_receive(:find).with("1")
      delete_destroy
    end
    
    it "Should assign a product instant varable" do
      delete_destroy 
      assigns[:product].should eql @product
    end
    
    it "should redirect to products index" do
      delete_destroy
      response.should redirect_to(products_path)
    end
    
    it "should delete the image" do
      @product.should_receive(:image=).with(nil)
      delete_destroy
    end
    
    it "should save the product successfully" do
      @product.should_receive(:save).and_return(true)
      delete_destroy
      response.should redirect_to(products_path)
      flash[:notice].should eq "Image Deleted"
    end
    
    it "should fail to save the product" do
      @product.should_receive(:save).and_return(false)
      delete_destroy
      response.should redirect_to(products_path)
      flash[:alert].should eq "Image failed to delete"
    end
    
  end

end
