class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :subtotal, precision: 15, scale: 2
      t.integer :user_id

      t.timestamps
    end
  end
end
