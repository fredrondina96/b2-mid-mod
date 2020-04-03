Rails.application.routes.draw do

  get "/mechanics", to: 'mechanics#index'

  get "/amusmant_parks/:park_id", to: 'parks#show'
end
