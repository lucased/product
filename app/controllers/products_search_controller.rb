class ProductsSearchController < ApplicationController
  before_filter :sub_categories, :categories, :only => [:sub_category_search, :category_search]
  
  def sub_category_search
    @sub_category = SubCategory.find_by_name(params[:term])
    if @sub_category.nil?
      redirect_to products_path, :alert => "Sub category not found"
    else
       @products = @sub_category.products
     end
  end
  
  def category_search
    @term = params[:term]
    @category = Category.find_by_name @term
    if @category.nil?
      redirect_to products_path, :alert => "Category not found"
    else
      @products = @category.products
    end
    
  end
  
  private 
  
  def sub_categories
    @sub_categories = SubCategory.all
  end
  
  def categories
    @categories = Category.all
  end
  
end
