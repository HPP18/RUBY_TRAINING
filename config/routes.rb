Rails.application.routes.draw do
  root "posts#index"

  get "/login", to: "login#login"
  post "/login", to: "login#setlogin"
  post "/logout", to: "login#setlogout"
end
