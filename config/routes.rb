Rails.application.routes.draw do
  get 'actions/create'
  resources :chunks
  resources :actions
  
  resources :users

  root to: 'chunks#genesis'
end
