Rails.application.routes.draw do
  # Devise routes for admin users
  devise_for :admin_users, ActiveAdmin::Devise.config

  # Mount ActiveAdmin at /admin
  ActiveAdmin.routes(self)

  # Specify the namespace for the users registrations controller
  devise_for :users, controllers: { registrations: 'user_management/registrations' }

  # Root route
  # root 'products#index'

  # Routes for regular users to view about page and contact page
  get '/about', to: 'about#show', as: 'about'
  get '/contact', to: 'contact#show', as: 'contact'

  # Resources for categories
  resources :categories do
    resources :books, only: [:index]
  end

  # Resources for products
  resources :products do
    post 'add_to_cart', on: :member
    get 'view_cart', on: :collection
    delete 'remove_from_cart', on: :member
  end
end
