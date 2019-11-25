Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :products, only: [:index, :new, :create] do
  
    namespace :admin do
    resources :products, only: [:new, :create, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end

  get '/cart', to: 'order_items#index'
  resources :order_items, path: 'cart/items'

get '/cart/checkout', to: 'orders#new', as: :checkout
patch '/cart/checkout', to: 'orders#create'

end

