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


  get 'most_comments', to: 'recipes#most_comments'

  get 'easy_recipe', to: 'recipes#easy_recipe'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
