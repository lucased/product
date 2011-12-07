require 'spec_helper'

describe Spec do
  
  describe "validations" do
    before(:each) do
      @spec = Spec.new
    end
    
    it "should not be valid without title & value" do
      @spec.should_not be_valid
    end
    
    it "should be valid with title & value, and belong to a product" do
      @spec.title = "Shutter Speed"
      @spec.value = "fast"
      @spec.product = Product.new(:image_url => "some image url",
                                  :pdf_url => "some pdf url",
                                  :title => "foo cam")
      @spec.should be_valid
    end
  end
  
end
