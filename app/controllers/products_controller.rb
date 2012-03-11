class ProductsController < ApplicationController
  include Shared::NavigationMethods
  before_filter :sub_categories, :categories, :only => [:index, :new, :edit]
  
  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end
  
  def edit
    get_product
  end
  
  def update
    get_product
    if @product.update_attributes(params[:product])
      redirect_to edit_product_path(@product), :notice => "Product updated!"
    else
      flash.now[:alert] = "Failed to update!"
      render "edit"
    end
  end
  
  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to products_path, :notice => "Product created!"
    else
      flash.now[:alert] = "Failed to save!"
      render "new"
    end
  end
  
  def destroy
    get_product
    if @product.destroy
      flash[:notice] = "Product deleted."
    else
      flash[:alert] = "Failed to delete product."
    end
     
    redirect_to products_path
  end
  
  private
  
  def get_product
    @product = Product.find(params[:id])
  end
  
end
