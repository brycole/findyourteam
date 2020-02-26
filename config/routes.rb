Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :games, only: [ :index, :show ] do
    resources :teams, only: [ :new, :create ]
  end

  resources :teams do
    resources :positions
    resources :pending_applications, only: [ :index, :create ]
  end

  get 'positions', to: 'positions#all'
end
