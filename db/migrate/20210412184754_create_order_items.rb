class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.decimal :item_price
      t.integer :quantity
      t.decimal :PST
      t.decimal :GST
      t.decimal :HST
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
