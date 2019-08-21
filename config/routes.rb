Rails.application.routes.draw do
  post '/distance', to: 'distances#create', as: 'distance'
  get '/cost', to: 'cost#index', as: 'cost'
end
