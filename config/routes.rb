Rails.application.routes.draw do
  # resources :users, only: [:edit, :update] do
  #   collection do

  #   end
  # end
  resources :superpowers, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy] do
    resources :reviews, only: [:new, :create]
  end
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'

  resources :users, only: [:edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
