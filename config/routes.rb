Rails.application.routes.draw do
  get 'static/index'
  get 'actions/create'

  resources :chunks
  resources :actions  

  devise_for :users
  resources :users do
    get '/stories', to: 'users#stories', on: :member

    get '/invite',  to: 'users#invite',  on: :collection
  end

  root to: 'static#index'
end
