class CheckoutsController < ApplicationController
  def index
    if session[:customer_account].nil?
      redirect_to customers_url
    else
      logger.debug(session[:customer_account])
      @addresses = Address.where(customer_id: session[:customer_account]["id"].to_i).joins(:province)
      logger.debug("YOLO YOLO: #{@addresses.nil?}")
      @customer_id = session[:customer_account]["id"]
    end
  end

  def new
    ids = []
    session[:shopping_cart].each_key { |key| ids.append(key) }
    @products = Product.find(ids)
    @items = session[:shopping_cart]
    session[:delivery_address] = params[:id].to_i
    @address = Address.find(params[:id])
  end

  def create
    province = Province.find(session[:delivery_address])
    gst = province.current_GST
    hst = province.current_HST
    pst = province.current_PST

    @order = Order.create(
      PST:         pst,
      GST:         gst,
      HST:         hst,
      customer_id: session[:customer_account]["id"]
    )

    ids = []
    session[:shopping_cart].each_key { |key| ids.append(key) }
    products = Product.find(ids)

    products.each do |p|
      logger.debug(p.id)
      OrderItem.create(
        item_price: p.price,
        quantity:   session[:shopping_cart][p.id.to_s],
        product_id: p.id,
        order_id:   @order.id
      )
    end

    id = @order.id
    @processed_items = OrderItem.where(order_id: id).joins(:product)

    session[:shopping_cart] = {}
    session[:delivery_address] = nil
  end

  def update
    logger.debug("You did it")
  end
end
