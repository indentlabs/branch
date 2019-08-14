Rails.application.routes.draw do
  get 'static/index'
  get 'actions/create'

  resources :chunks
  resources :actions  
  resources :users do
    get '/stories', to: 'users#stories', on: :member
  end

  root to: 'static#index'
end
