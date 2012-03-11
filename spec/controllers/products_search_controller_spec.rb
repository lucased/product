require 'spec_helper'

describe ProductsSearchController do
  
  describe "Error handling" do
    
    describe "category_search" do
      
      before(:each) do
        @category = mock_model(Category)
        @products = mock(Array)
        Category.stub!(:find_by_name).and_return(@category) 
        @category.stub!(:products).and_return(@products)
        
      end
      
      def get_category_search
        get :category_search, :term => "Remote Heads"
      end
      
      it "should set an alert message when category not found" do
        Category.should_receive(:find_by_name).and_return(nil) 
        get_category_search
        flash[:alert].should eq "Category not found"
      end
      
      it "should redirect when category not found" do
        Category.should_receive(:find_by_name).and_return(nil)
        get_category_search
        response.should redirect_to products_path
      end
      
       it "should retrieve the category" do
          Category.should_receive(:find_by_name).and_return(@category) 
          get_category_search
        end
        
        it "should retrieve products collection from category" do
          @category.should_receive(:products).and_return(@products)
          get_category_search
        end
      
    end
    
    describe "sub_category_search" do

      before(:each) do
        @sub_category = mock_model(SubCategory)
        @products = mock(Array)
        SubCategory.stub!(:find_by_name).and_return(@sub_category) 
        @sub_category.stub!(:products).and_return(@products)

      end

      def get_sub_category_search
        get :sub_category_search, :term => "Remote Heads"
      end

      it "should set an alert message when sub_category not found" do
        SubCategory.should_receive(:find_by_name).and_return(nil) 
        get_sub_category_search
        flash[:alert].should eq "Sub category not found"
      end

      it "should redirect when sub_category not found" do
        SubCategory.should_receive(:find_by_name).and_return(nil)
        get_sub_category_search
        response.should redirect_to products_path
      end

      it "should retrieve the sub_category" do
        SubCategory.should_receive(:find_by_name).and_return(@sub_category) 
        get_sub_category_search
      end

      it "should retrieve products collection from sub_category" do
        @sub_category.should_receive(:products).and_return(@products)
        get_sub_category_search
      end

    end
    
  end

end
