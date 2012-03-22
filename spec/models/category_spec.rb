require 'spec_helper'

describe Category do
  
  before(:each) do
     @category = Category.find_by_name("Jibs & Cranes")
  end
  
  it "should have many sub categories" do
    @category.should have_many(:sub_categories) 
  end
  
  describe "has_sub_categories?" do
    
    describe "with sub categoies" do
      
      it "should return true is category has sub categories" do
        @category.has_sub_categories?.should be true
      end
      
    end
    
    
    describe "without sub categoies" do
      
      before(:each) do
        @category = Category.find_by_name("Remote Heads")
      end

       it "should return false is category has sub categories" do
         @category.has_sub_categories?.should be false
       end

     end
 
    
    
  end

end
