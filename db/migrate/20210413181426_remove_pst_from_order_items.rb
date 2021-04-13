class RemovePstFromOrderItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_items, :PST, :decimal
  end
end
