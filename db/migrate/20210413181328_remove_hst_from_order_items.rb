class RemoveHstFromOrderItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_items, :HST, :decimal
  end
end
