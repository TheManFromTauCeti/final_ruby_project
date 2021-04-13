class RemoveGstFromOrderItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_items, :GST, :decimal
  end
end
