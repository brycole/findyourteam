Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  post "/set_user_team", to: "teams#set_user_team", as: :set_user_team
  resources :games, only: [ :index, :show ] do
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :teams, only: [:show, :index, :new, :create] do
    resources :positions
  end
end
