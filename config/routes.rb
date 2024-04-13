Rails.application.routes.draw do
  devise_for :users
  # Devise routes for admin users
  devise_for :admin_users, ActiveAdmin::Devise.config

  # ActiveAdmin routes
  ActiveAdmin.routes(self)

  # Regular user routes for products
  resources :product, only: [:index, :show]

  # Routes for regular users to view contact and about pages
  resources :contact_pages, only: [:show], path: 'contact'
  resources :about_pages, only: [:show], path: 'about'

  # Namespace for admin routes
  namespace :admin do
    # Route for admin to manage about page
    resource :about, only: [:show], controller: 'abouts', path: 'about'
  end

  # Root route
  root 'product#index'

  # Route for regular users to view about page
  get '/about', to: 'about#show', as: 'about'
  get '/contact', to: 'contact#show', as: 'contact'
end
