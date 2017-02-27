Rails.application.routes.draw do
  root 'sessions#index'
  resources :users
  resources :sessions
  resources :events
  resources :discussions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
