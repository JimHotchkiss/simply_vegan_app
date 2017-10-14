Rails.application.routes.draw do
  root to: 'static#welcome'

  get 'login',  to: 'sessions#new'
  put 'login',  to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
