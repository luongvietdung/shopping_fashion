Rails.application.routes.draw do
  devise_for :admins

  namespace :manager do
    root "static_pages#index"
  end
end
