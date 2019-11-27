Rails.application.routes.draw do
  resources :tasks_labels
  resources :labels
 root 'sessions#new'
  resources :users
  resources :tasks 
  resources :sessions
  namespace :admin do
    resources :users
  end
end 
