class ShoppingCart < ApplicationRecord
  has_one :order
  has_many :items, through: :order, class_name: 'OrderItem'
  belongs_to :user
  delegate :subtotal, to: :order

  attr_accessor :token
  
    def initialize(token)
      super ()
      @token = token.to_s
    end

    def order
      @order ||= Order.find_or_create_by(token: @token, status: 'cart', first_name: 'test', last_name: 'test') do |order|
        order.update_attribute(:subtotal, 0)
      end
    end
  
    
    def items_count
      order.items.sum(:quantity)
    end

    def add_item(product_id, quantity=1)
      product = Product.find(product_id)
      order_item = order.items.find_or_create_by(price: product.price, quantity: quantity)
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
  

