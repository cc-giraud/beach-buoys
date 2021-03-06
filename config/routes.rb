Rails.application.routes.draw do
  devise_for :users
  get "profile", to: "pages#profile"
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :buoys, except: [:destroy] do
    resources :bookings, only: [:new, :create, :show]
    resources :reviews, only: [:new, :create]
  end
  resources :bookings, only: [:destroy]
  resources :reviews, only: [:destroy]
end
