Rails.application.routes.draw do

  resources :sessions
  resources :users
  resources :attractions
  resources :rides
  root 'static_pages#home'

  get '/signin', to: 'sessions#new'
  get '/signout', to: 'sessions#destroy'

end