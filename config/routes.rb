# Updating routes? Please update the readme as well.

Rails.application.routes.draw do
  resources :items, except: [:destroy] do
    resources :item_comments
    member do
      post :toggle
      post :vote, to: 'user_item_votes#create'
      delete :vote, to: 'user_item_votes#destroy'
    end
  end

  root to: 'items#index'

  resources :users, except: [:index]
  resources :user_sessions, only: [:new, :create, :destroy]

  get 'login' => 'user_sessions#new', as: :login
  match 'logout' => 'user_sessions#destroy', as: :logout, via: [:get, :post]

  namespace :admin do
    root to: 'items#index'
    resources :items
  end
end
