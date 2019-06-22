# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, skip: :all
  as :user do
    get "/login" => "devise/sessions#new", :as => :new_user_session
    post "/login" => "devise/sessions#create", :as => :user_session
    delete "/logout" => "devise/sessions#destroy", :as => :destroy_user_session
    get "/register" => "devise/registrations#new", :as => :new_user_registration
    post "/register" => "devise/registrations#create", :as => :user_registration
  end

  namespace :manager do
    root "static_pages#index"
    resources :users
    resources :products
    resources :orders, only: [:index]
  end

  resources :users, only: %i[show edit update]

  devise_for :admins, controllers: {
    sessions: "manager/sessions"
  }, path: :manager

  get "/shop", to: "products#index"

  root "static_page#index"
  resources :products, only: [:show]
  resources :carts, only: %i[create]
  resources :reviews
end
