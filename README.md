# README

I pretty much put every single change in it's own commit. I'll try to make this README comprehensive enough that you don't need to go through every commit, however if something is unclear, you can find exactly what I did in the corresponding commit. Since there are quite a few, I'd recommend using Ctrl + F to look for a specific one instead of scrolling through all of them.

Functionality:
  *Shopping Cart things have been removed. The functionality of a shopping cart is now done entirely with Orders.
  *A lot of links have been removed, so some things do not work as they used to, however nothing should break/error.
  *Products should show up on the products index, which is the root page.
  *Sign in / Sign out
  *Products should be able to be added to cart (an order), and redirect to the Order show page.
  *If the user does not have an Order, one will be created.
  *On the order items index (cart page) items should be able to be deleted.

Next Steps (just my opinion here, do with your app as you wish):
  *Link the icon in the top right to the cart page
  *Get the Add products link in the footer to send to a form to create a product.
  *The checkout button on the OrderItems index (cart page) should do something. If you're on a time crunch maybe just fake that it's doing some type of checkout (like redirect to the home page, change the order from 'cart' to like 'shipped', and display some message like 'your order is on its way'). If you have time, integrate Stripe.

Changes:
  Database / Migrations:
    *Deleted both of the add_shopping_cart_id migrations.
    *Deleted the create_shopping_cart migration
    *Deleted add_user_id_to_shopping_cart migration
    *Remove the price, token, first_name and last_name columns from create_order_items migration
    *Added product_id to the create_order_items migration
    *Added user_id to the create_orders migration

  Models:
    *Order
      *Removed the belongs_to :shopping_cart
      *Added belongs_to :user
    *User
      *Removed has_one :shopping_cart
      *Added has_many :orders
    *OrderItem
      *Changed belongs_to :products to belongs_to :product (An extra s can cause a lot of problems...took me a while to find this)

  Controllers:
    *ApplicationController:
      *Commented everything regarding Cart. Only the protect from forgery line should remain inside the ApplicationController block. (https://github.com/peteyyy/Shopper-updated/commit/5ca7df4b0cc02c84425e20978526acd34676833a)
    *OrderItemsController:
      *Removed code from the index, create, and destroy actions that were pertaining to ShoppingCart
      *Set @items in the index method.
      *Created a current_item helper method
      *Added code to delete an item in the destroy method
    *OrdersController:
      *Added an add_item method that should grab the product_id and quantity from the params sent from the form on the Products/index view, then will find the user's order and add the items to the order. If an order does not exist it will create one. (https://github.com/peteyyy/Shopper-updated/commit/0b154897519f4280843d73cf9f28ef9ce556f98e)
      -Added a current_order helper method (https://github.com/peteyyy/Shopper-updated/commit/0b154897519f4280843d73cf9f28ef9ce556f98e)
      *Changed the order_params to accept user_id, status, and subtotal
      *Changed current_order helper method to create an order for the current user with status "cart" if none existed already. (https://github.com/peteyyy/Shopper-updated/commit/e2d9501e74ed3ed19dc2c6d00cf6f80a6d2d184b)

  Views:
    *application.html:
      -Removed the cart_path link. (https://github.com/peteyyy/Shopper-updated/commit/c78ecbedba9b8cb3518d4408cb7950041de98149)
    *products/index.html.erb:
      -Changed the form_tag block to send data to the additem_path. (https://github.com/peteyyy/Shopper-updated/commit/0b154897519f4280843d73cf9f28ef9ce556f98e)
    *order_items/index:
      *Removed two links that pertain to shopping cart / checkout. Changed the line displaying price from item.price to item.product.price to fit out new associations.

  Routes:
    *Added resources :orders to the routes.rb file, after this there is no need for the checkout routes, so those are commented out.
    *A POST route has been added to allow the form on the products/index page to send data to the OrdersController#add_item method. (https://github.com/peteyyy/Shopper-updated/commit/9f62ea25244c31e7a1e43482f4b9bc068be817c4)

