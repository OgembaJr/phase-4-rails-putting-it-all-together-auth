Rails.application.routes.draw do
  get 'recipes/index'
  post '/signup', to: 'users#create'
  get '/signup', to: 'users#new'
  get '/me', to: 'users#show'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/recipes', to: 'recipes#index'
  post '/recipes', to: 'recipes#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
