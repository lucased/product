require 'spec_helper'

describe Category do
  
  it "should have many sub categories" do
    category = Category.find_by_name("Jibs & Cranes")
    category.should have_many(:sub_categories) 
  end

end
