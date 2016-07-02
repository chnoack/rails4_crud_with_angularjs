Rails.application.routes.draw do

  resources :accounts
  resources :users

  root 'users#index'

end
