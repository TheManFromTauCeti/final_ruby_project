class AddGstToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :GST, :decimal
  end
end
