class Products::ImageController < ApplicationController
  def destroy
    @product = Product.find(params[:product_id])
    @product.image = nil
    if @product.save
      flash[:notice] = "Image Deleted"
    else
      flash[:alert] = "Image failed to delete"
    end
     redirect_to products_path
  end
end
