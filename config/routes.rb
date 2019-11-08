Rails.application.routes.draw do
 root 'sessions#new'
  resources :users
  resources :tasks 
  resources :sessions
end 
