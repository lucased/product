class ProductsSearchController < ApplicationController
  before_filter :sub_categories, :only => [:sub_category_search, :category_search]
  
  def sub_category_search
    @sub_category = SubCategory.find_by_name(params[:term])
    @products = @sub_category.products
  end
  
  def category_search
    @category = Category.find_by_name(params[:term])
    @products = @category.products
  end
  
  private 
  def sub_categories
    @sub_categories = SubCategory.all
  end
  
end
