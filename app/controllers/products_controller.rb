class ProductsController < ApplicationController
  def index
    if params[:category_id] == ""
      @products = Product.where("name LIKE ?", "%#{params[:query]}%")
    else
      @products = Product.joins(:product_categories)
                         .where(
                           "category_id = ? AND name LIKE ? ",
                           params[:category_id], "%#{params[:query]}%"
                         )
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
