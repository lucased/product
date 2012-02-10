class ProductsController < ApplicationController
  
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
      redirect_to products_path, :notice => "Product updated!"
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
  
  private
  
  def get_product
    @product = Product.find(params[:id])
  end
  
end
