Rails.application.routes.draw do

  get '/users', to: 'users#index'
  post '/users', to: 'users#create'
  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users/:id', to: 'users#show', as: 'user'

  # You can have the root of your site routed with "root"
  root 'users#index'
end
