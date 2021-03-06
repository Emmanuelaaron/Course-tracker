Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :projects, only: [:new, :index, :create, :show]
  resources :coursemodules, only: [:new, :index, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'profile', to: 'sessions#profile'
  post 'addinternalproject', to: 'projects#add_internal_project'
  get 'getinternalprojects', to: 'projects#internal_projects'
  get 'getprojects', to: 'projects#all_projects'
  root to: 'sessions#profile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
