class Products::SpecsController < ApplicationController
  before_filter :get_product, :only => [:new, :index, :create, :destroy]
  
  def new
    @spec = @product.specs.new
  end
  
  def create
    @product.specs.new(params[:spec])
    if @product.save
      redirect_to edit_product_path(@product), :notice => "Image added"
    else
      render new
    end
  end
  
  def destroy
    @product = Product.find(params[:product_id])
    @spec = @product.specs.find(params[:id])
    if @spec.destroy
      flash[:notice] = "Spec Deleted"
    else
      flash[:alert] = "Spec failed to delete"
    end
     redirect_to products_path
  end
  
  private
  def get_product
    @product = Product.find(params[:product_id])
  end
  
end
