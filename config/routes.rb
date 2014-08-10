Compete::Application.routes.draw do
  #Static Pages
  root 'static_pages#home'

  #Accomplishments
  resources :accomplishments

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