require 'spec_helper'

describe Spec do
  
  before(:each) do
     @spec = Spec.new
   end
  
  describe "validations" do
 
    
    it "should not be valid without title & value" do
      @spec.should_not be_valid
    end
    
    it "should be valid with title & value, and belong to a product" do
      @spec.title = "Shutter Speed"
      @spec.value = "fast"
      @spec.product = Product.new(:image_file_name => "some image url",
                                  :pdf_file_name => "some pdf url",
                                  :title => "foo cam")
      @spec.should be_valid
    end
  end
  
  describe "text_description" do
    
    before(:each) do
      @spec.title = "Length"
      @spec.value = "10"
    end
    
    it "should return formatted title and value" do
      @spec.text_description.should eq "Length: 10"
    end
  end
  
end
