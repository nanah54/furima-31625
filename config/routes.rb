Rails.application.routes.draw do
  get 'items/edit'
  devise_for :users
  root to: "items#index"
  resources :users, only: [:edit, :update]
  resources :items, only: [:index, :new, :create]
end
