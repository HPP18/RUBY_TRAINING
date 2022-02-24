Rails.application.routes.draw do
  root 'read#index'

  post '/show', to: 'read#show'
  get '/show', to: 'read#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
