class CartController < ApplicationController
  def index
    logger.debug(session[:shopping_cart])
    ids = []
    session[:shopping_cart].each_key { |key| ids.append(key) }
    @products = Product.find(ids)
    @items = session[:shopping_cart]
  end

  def create
    session[:shopping_cart][params[:id]] = params[:quantity]
    logger.debug(session[:shopping_cart])
    redirect_to "/cart/"
  end

  def destroy
    logger.debug("Removing #{params[:id]}")
  end
end
