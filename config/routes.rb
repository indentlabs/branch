Rails.application.routes.draw do
  resources :chunks
  resources :users

  root to: 'chunks#genesis'
end
