DrillIt::Application.routes.draw do
  #Static Pages
  root 'static_pages#home'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'

  #Users
  resources :users
  match '/signup', to: 'users#new', via: 'get'

  #Sessions
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
end