require 'spec_helper'

describe Product do
  
  before(:each) do
    @product = Product.new
  end
  
  describe "validations" do
    
    def valid_product
      @product.image_file_name = "Some image url"
      @product.pdf_file_name = "some pdf url"
      @product.title = "foo cam"
      @product.specs << Spec.new(:title => "Shutter", :value => "fast", :product => @product)
      @product.category = Category.find_by_name("Jibs & Cranes")
    end
    
    it "should not be valid without image_url, pdf_url & title" do
      @product.should_not be_valid
    end
    
    it "should not be valid with only image_url" do
      @product.image_file_name = "some image url"
      @product.should_not be_valid
    end
    
    it "should not be valid with only pdf_url" do
      @product.pdf_file_name = "some pdf url"
      @product.should_not be_valid
    end
    
    it "should be valid with image_url, pdf_url, title & at least 1 spec" do
      valid_product
      
      @product.should be_valid
    end
    
  end
  
  describe "Associations" do
    
    before(:each) do
      @product = Product.find_by_title("Camera")
    end
    
    it "should belong to category" do
      @product.should belong_to(:category)
    end
    
    it "should allow assignment of category" do
      category_name = "Jibs & Cranes"
      @product.category = Category.find_by_name(category_name)
      @product.category.name.should eq category_name
    end
    
    it "should have one sub caterogy thought caterogy" do
      @product.should belong_to(:sub_category)
    end
    
    it "should allow assignment of sub_category" do
      sub_category_name = "Mini-Jib"
      @product.sub_category = SubCategory.find_by_name(sub_category_name)
      @product.sub_category.name.should eq sub_category_name
    end
    
  end

  
  
end
