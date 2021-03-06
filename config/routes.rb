Compete::Application.routes.draw do
  #Static Pages
  root 'sessions#new'

  #Accomplishments
  resources :accomplishments do
    member do
      get 'load_update_form'
    end
  end

  #Competitions
  resources :competitions do
    member do
      get 'join_battle'
    end
  end

  #Stakes
  resources :stakes

  #Users
  resources :users
  match '/signup', to: 'users#new', via: "get"

  #Sessions
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin', to: 'sessions#new', via: "get"
  match '/signout', to: 'sessions#destroy', via: "delete"
end