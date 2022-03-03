Rails.application.routes.draw do
 root "users#index"

 resources :users
 get 'password/reset', to: 'password_reset#index'
 post 'password/reset', to: 'password_reset#create'
 get 'password/reset/edit', to: 'password_reset#edit'
 patch 'password/reset/edit', to: 'password_reset#update'
end
