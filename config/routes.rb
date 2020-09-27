Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :projects
  resources :coursemodules
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'profile', to: 'sessions#profile'
  root to: 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
