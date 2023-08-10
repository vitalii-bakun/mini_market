Rails.application.routes.draw do
  # Home page
  root 'market/products#index'

  # Users belong to the Market
  devise_for :market_users, controllers: {
    # confirmations: 'market/users/confirmations',
    omniauth_callbacks: 'market/users/omniauth_callbacks',
    passwords: 'market/users/passwords',
    registrations: 'market/users/registrations',
    sessions: 'market/users/sessions'
    # unlocks: 'market/users/unlocks',
  }

  # Market
  scope module: 'market' do
    get 'cart', to: 'carts#index', as: 'cart'
    delete 'cart/destroy_all', to: 'carts#destroy_all', as: 'cart_destroy_all'

    resources :products, only: %i[index show] do
      delete 'cart/destroy', to: 'carts#destroy', as: 'cart_destroy'
      post 'cart/add', to: 'carts#add', as: 'cart_add'
      delete 'cart/remove', to: 'carts#remove', as: 'cart_remove'
      match 'cart/update', to: 'carts#update', as: 'cart_update', via: %i[put patch]
    end

    resources :customers, only: %i[index new create show]
    resources :pages, only: %i[show]
  end

  # Users belong to the Admin
  devise_for :admin_users, path: 'admin', controllers: {
    # confirmations: 'admin/users/confirmations',
    # omniauth_callbacks: 'admin/users/omniauth_callbacks',
    passwords: 'admin/users/passwords',
    # registrations: 'admin/users/registrations',
    sessions: 'admin/users/sessions'
    # unlocks: 'admin/users/unlocks',
  }

  # Admin
  namespace :admin do
    resources :market_users
    resources :admin_users
    resources :products
    resources :pages
    get '/', to: 'dashboard#index', as: 'dashboard'
    resources :customers do
      resources :orders, except: %i[show index]
    end
  end
end
