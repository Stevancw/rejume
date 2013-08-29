Rejume::Application.routes.draw do
  root to: 'pages#home'
  resources   :sessions, only: [:new, :create]
  resources  :users, only: [:new, :create]
  get 'login', to: 'sessions#new', as: 'login'
  get 'signup', to: 'users#new', as: 'signup'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resource :dashboard, only: [:show]
end
