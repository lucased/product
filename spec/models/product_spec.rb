require 'spec_helper'

describe Product do
  
  before(:each) do
    @product = Product.new
  end
  
  describe "validations" do
    
    it "should not be valid without image_url, pdf_url & title" do
      @product.should_not be_valid
    end
    
    it "should not be valid with only image_url" do
      @product.image_url = "some image url"
      @product.should_not be_valid
    end
    
    it "should not be valid with only pdf_url" do
      @product.pdf_url = "some pdf url"
      @product.should_not be_valid
    end
    
    it "should be valid with image_url, pdf_url, title & at least 1 spec" do
      @product.image_url = "Some image url"
      @product.pdf_url = "some pdf url"
      @product.title = "foo cam"
      @product.specs << Spec.new(:title => "Shutter", :value => "fast", :product => @product)
      
      @product.should be_valid
    end
    
  end
  

  
  
end
