class AddShoppingCartIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :shopping_cart_id, :integer
  end
end
