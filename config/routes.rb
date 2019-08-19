Rails.application.routes.draw do
  resources :users, only: [:edit, :update]
  resources :superpowers, only: [:index, :show, :new, :create, :destroy] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy] do
    resources :reviews, only: [:new, :create]
  end
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
