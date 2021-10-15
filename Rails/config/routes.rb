Rails.application.routes.draw do
  resources :waitlists
  resources :applications
  resources :properties
  resources :admins
  resources :applicants
  resources :leasing_agents
  root 'home#index'
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: "applicants#new", as: 'signup'
  get 'login', to: "sessions#new", as: 'login'
  get 'agent_signup', to: "leasing_agents#new", as: 'agent_signup'
  get 'agent_login', to: "sessions#new", as: 'agent_login'
  #get 'admin_signup', to: "admin#new", as: 'admin_signup'
  get 'admin_login', to: "sessions#new", as: 'admin_login'
  get 'logout', to: "sessions#destroy", as: 'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
