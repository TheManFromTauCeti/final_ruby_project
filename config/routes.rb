Rails.application.routes.draw do
  get 'customers/index'
  get 'customers/show'
  get 'customers/create'
  resources :categories, only: %i[index show]
  resources :products, only: %i[index show]
  root to: "home#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
