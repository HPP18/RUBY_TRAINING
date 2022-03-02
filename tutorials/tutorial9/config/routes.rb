Rails.application.routes.draw do
  root "images#index"

  post "/image", to: "images#setimage"
  get "/image", to: "images#setimage"
end
