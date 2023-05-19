Rails.application.routes.draw do
  root 'market/products#index'

  scope module: 'market' do
    get 'cart', to: 'session_cart#index', as: 'cart'
    delete 'cart/destroy_all', to: 'session_cart#destroy_all', as: 'cart_destroy_all'

    resources :products, only: %i[index show] do
      delete 'cart/destroy', to: 'session_cart#destroy', as: 'cart_destroy'
      post 'cart/add', to: 'session_cart#add', as: 'cart_add'
      match 'cart/update', to: 'session_cart#update', as: 'cart_update', via: %i[put patch]
    end

    resources :customers, only: %i[new create show]
  end

  devise_for :users, path: 'panel'
  namespace :panel do
    get '/', to: 'dashboard#index', as: 'dashboard'
    resources :products
    get 'customers/:status', to: 'customers#status', as: 'customers_status',
                             constraints: { status: /(new|send|done|canceled)_order/ }
    resources :customers, only: %i[edit update destroy] do
      get 'orders', to: 'orders#index', as: 'orders'
      match 'status', to: 'customers#status_update', as: 'status_update', via: %i[put patch]
    end
  end
end
