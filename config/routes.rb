Rails.application.routes.draw do
  root 'products#index'

  get 'cart', to: 'session_cart#index', as: 'cart'
  delete 'cart/destroy_all', to: 'session_cart#destroy_all', as: 'cart_destroy_all'

  resources :products do
    delete 'cart/destroy', to: 'session_cart#destroy', as: 'cart_destroy'
    post 'cart/add', to: 'session_cart#add', as: 'cart_add'
    match 'cart/update', to: 'session_cart#update', as: 'cart_update', via: %i[put patch]
  end

  resources :customers, only: %i[new create show]

  namespace :admin do
    resources :orders, only: %i[index]
  end
end
