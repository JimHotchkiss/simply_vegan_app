Rails.application.routes.draw do

  root to: 'recipes#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  get  'login',  to: 'sessions#new'
  post 'login',  to: 'sessions#create'
  delete  'logout', to: 'sessions#destroy'
  get 'logout', to: 'sessions#destroy' # include a get request for destroy

  resources :users, only: [:new, :create]
  resources :ingredients, only: [:show]
  resources :recipes
  resources :comments, only: [:create]

  resources :recipes, only: [:show] do
    resources :comments, only: [:new]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
