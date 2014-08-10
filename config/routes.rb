Compete::Application.routes.draw do
  #Static Pages
  root 'static_pages#home'

  #Competitions
  resources :competitions

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