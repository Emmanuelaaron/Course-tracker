Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :projects
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
