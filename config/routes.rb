# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  namespace :manager do
    root "static_pages#index"
    resources :users
    resources :products
  end
  devise_for :admins, controllers: {
    sessions: "manager/sessions"
  }, path: :manager
  get "/shop", to: "products#index"
  root "products#show"
end
