Rails.application.routes.draw do
  root 'products#index'

  get '/cart', to: 'cart#index', as: 'cart_index'

  resources :products do
    post '/cart', to: 'cart#create', as: 'add_to_cart'
    delete '/cart/destroy', to: 'cart#destroy', as: 'remove_from_cart'
  end

  resources :checkout, only: %i[index create show]
end
