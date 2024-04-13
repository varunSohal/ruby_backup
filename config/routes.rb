Rails.application.routes.draw do
  # Devise routes for admin users
  devise_for :admin_users, ActiveAdmin::Devise.config

  # Specify the namespace for the users registrations controller
  devise_for :users, controllers: { registrations: 'user_management/registrations' }

  # Root route
  root 'products#index'

  # Routes for regular users to view about page and contact page
  get '/about', to: 'about#show', as: 'about'
  get '/contact', to: 'contact#show', as: 'contact'

  resources :categories, only: [:show] do
    get 'product', to: 'categories#product', on: :member
  end

  resources :product, only: [:index, :show] # corrected from :product to :products

end
