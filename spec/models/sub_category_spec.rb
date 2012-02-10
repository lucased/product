require 'spec_helper'

describe SubCategory do
  
  it "should have many sub categories" do
    sub_category = SubCategory.find_by_name("Mini-Jib")
    sub_category.should belong_to(:category) 
  end
  
end
