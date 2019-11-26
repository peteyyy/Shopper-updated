class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :first_name, null:false
      t.string :last_name, null:false
      t.decimal :subtotal, precision: 15, scale: 2
      t.string :token
      t.integer :user_id

      t.timestamps
    end
  end
end
