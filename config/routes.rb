Rails.application.routes.draw do

  root to: 'recipes#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  get  'login',  to: 'sessions#new'
  post 'login',  to: 'sessions#create'
  delete  'logout', to: 'sessions#destroy'
  get 'logout', to: 'sessions#destroy' # include a get request for destroy

  resources :users, only: [:new, :create]
  resources :ingredients, only: [:show]


  resources :recipes do
  # this allows 'shallow' nesting
    resources :comments, only: [:show, :new]
  end
  resources :comments
  # resources :articles do
  # resources :comments, only: [:index, :new, :create]
  # end
  # resources :comments, only: [:show, :edit, :update, :destroy]

  get 'most_comments', to: 'recipes#most_comments'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
