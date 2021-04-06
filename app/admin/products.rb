ActiveAdmin.register Product do
  permit_params :name, :description, :price, :in_stock, :stock_quantity
end
