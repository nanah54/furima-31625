Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:edit, :update]
  resources :items do
  resources :buyers, only: [:index,:create]
end
