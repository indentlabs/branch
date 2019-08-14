Rails.application.routes.draw do
  get 'static/index'
  get 'actions/create'

  resources :chunks
  resources :actions  
  resources :users

  root to: 'static#index'
end
