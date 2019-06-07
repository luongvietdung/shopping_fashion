# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  namespace :manager do
    root "static_pages#index"
    resources :products
  end
end
