class AddressesController < ApplicationController
  def index
    @customer_id = session[:customer_account]["id"]
    @addresses = Address.where(customer_id: @customer_id.to_i).joins(:province)
    logger.debug(@addresses)
  end

  def create
    @address = Address.create(
      street:      params[:street],
      city:        params[:city],
      postal_code: params[:postal_code],
      customer_id: params[:id].to_i,
      province_id: params[:province_id].to_i
    )
  end

  def edit
    @address = Address.find(params[:id])
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy

    redirect_to addresses_url
  end

  def update
    logger.debug("Here's: #{params[:address]}")

    address = Address.find(params[:address][:id])

    address.update(
      street:      params[:address][:street],
      city:        params[:address][:city],
      postal_code: params[:address][:postal_code],
      province_id: params[:address][:province_id].to_i
    )

    redirect_to addresses_url
  end
end
