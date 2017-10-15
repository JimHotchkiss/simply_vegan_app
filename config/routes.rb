Rails.application.routes.draw do
  root to: 'static#welcome'

  get '/auth/:provider/callback', to: 'sessions#create'
  get  'login',  to: 'sessions#new'
  post 'login',  to: 'sessions#create'
  get  'logout', to: 'sessions#destroy'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
