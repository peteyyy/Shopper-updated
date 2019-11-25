class AddUserIdToShoppingCart < ActiveRecord::Migration[5.2]
  def change
    add_column :shopping_cart, :user_id :integer
  end
end
