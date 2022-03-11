Rails.application.routes.draw do
  root "users#index"

  resources :users
  resources :posts
  get "/login", to: "login#login"
  post "/login", to: "login#setlogin"
  get "/logout", to: "login#setlogout"
  post "/logout", to: "login#setlogout"
end
