class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :quantity, default:0
      t.integer :product_id

      t.timestamps
    end
  end
end
