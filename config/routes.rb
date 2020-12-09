Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get 'items/search'
  resources :users, only: [:edit, :update]
  resources :items do
    resources :buyers, only: [:index,:create]
  end
end
