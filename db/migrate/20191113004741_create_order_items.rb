class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :quantity, default:0
      t.decimal :price, precision: 15, scale: 2, null:false

      t.timestamps
    end
  end
end
