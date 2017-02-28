Rails.application.routes.draw do
  root 'sessions#index'
  resources :users
  resources :sessions
  resources :events
  resources :discussions
  delete '/joins' => 'joins#destroy'
  resources :joins
end