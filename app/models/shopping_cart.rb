class ShoppingCart < ApplicationRecord
  has_many :orders
  has_many :items, through: :orders


    delegate :subtotal, to: :order
  
    def initialize(token:)
      @token = token
    end
  
      
    def order
      @order ||= Order.find_or_create_by(token: @token, status: 'cart') do |order|
        order.update_attribute(:subtotal, 0)
    end
  
    
    def items_count
      order.items.sum(:quantity)
    end
  
    def add_item(product_id:, quantity: 1)
      product = Product.find(product_id)
  
      order_item = order.items.find_or_create_by(product_id: product_id)
  
      order_item.price = product.price
      order_item.quantity = quantity
  
      ActiveRecord::Base.transaction do 
        order_item.save
        update_subtotal!
      end
    end
  
    def remove_items(id:)
      ActiveRecord::Base.transaction do 
        order.items.destroy(id)
        update_subtotal!
      end
    end
  
    private
  
    def update_subtotal!
      order.subtotal = order.items.sum('quantity * price')
      order.save
    end
  
end
  

end
