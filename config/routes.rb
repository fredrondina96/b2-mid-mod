Rails.application.routes.draw do

  get "/mechanics", to: 'mechanics#index'
  get "/mechanics/:id", to: 'mechanics#show'
  patch "/mechanics/:id", to: 'mechanics#update'

  get "/amusmant_parks/:park_id", to: 'parks#show'

  get "/rides/:id", to: 'rides#show'
end
