Rails.application.routes.draw do
  resources :homepage, only: [:index]

  root 'homepage#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

  get '/skills/search', to: 'skills#index'
  post '/skills', to: 'skills#create'


  get 'rooms/show'


  resources :conversations do
    resources :messages
  end
  resources :users, except: [:index]

  resources :categories, only: [:index] do
    resources :subcategories, only: [:index, :show]
  end

  mount ActionCable.server => '/cable'
end
