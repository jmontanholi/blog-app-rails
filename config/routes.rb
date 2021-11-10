Rails.application.routes.draw do
  root 'users#index'

  get 'sessions/new', to: 'sessions#new'
  post 'sessions/new', to: 'sessions#create'
  get 'sessions/logout', to: 'sessions#logout'
  
  get '/users/new', to: 'users#new'
  post '/users/new', to: 'users#create'
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'

  get '/users/:user/posts', to: 'posts#index'
  get '/users/:user/posts/:id', to: 'posts#show'
end
