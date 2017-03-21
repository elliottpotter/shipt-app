class AddQuantityToOrderProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :order_products, :quantity, :decimal, precision: 1, scale: 1
  end
end
