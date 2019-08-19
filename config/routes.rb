Rails.application.routes.draw do
  resources :distances
  get '/cost', to: 'cost#index', as: 'cost'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
