Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  post "/set_user_team", to: "teams#set_user_team", as: :set_user_team
  resources :games, only: [ :index, :show ] do
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :teams, only: [:show, :index, :new, :create] do
    resources :positions
    resources :pending_applications, only: [ :index, :create ]
  end

  get 'positions', to: 'positions#all'
  post 'captain_approve', to: 'pending_applications#captain_approve'

  get 'ranks', to: 'players#ranks'

  resources :players, only: [ :show ]

end
