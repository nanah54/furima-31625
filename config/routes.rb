Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:edit, :update]
  resources :items, only: [:index, :new, :create, :show, :destroy,:edit,:update]
  resources :buyers, only: [:index,:create]
end
