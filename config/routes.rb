Rails.application.routes.draw do
  resources :room_messages
  devise_for :users
  root to: 'pages#home'
  post "/set_user_team", to: "teams#set_user_team", as: :set_user_team
  post "/set_user_game", to: "pages#set_user_game", as: :set_user_game
  resources :games, only: [ :index, :show ] do
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :teams, only: [:show, :index, :new, :create] do
    resources :positions
    resources :pending_applications, only: [ :index, :create ]
    resources :rooms
  end

  get 'positions', to: 'positions#all'
  post 'captain_approve', to: 'pending_applications#captain_approve'
  post 'player_approve', to: 'pending_applications#player_approve'

  post 'create_default_positions', to: 'positions#create_default_positions'
  post 'delete_all_positions', to: 'positions#delete_all_positions'

  get 'ranks', to: 'players#ranks'

  get 'create_invitation', to: 'pending_applications#create_invitation'

  resources :players, only: [ :index, :show ]
  resources :pending_applications, only: [ :destroy ]

end
