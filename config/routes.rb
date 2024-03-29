Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  resources :customers, only: %i[index create show new]
  get "/signin", to: "login#signin"
  get "/signout", to: "login#signout"
  resources :categories, only: %i[index show]
  resources :products, only: %i[index show]
  resources :carts
  resources :addresses
  resources :checkouts
  resources :orders
  root to: "home#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
