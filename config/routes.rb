Rejume::Application.routes.draw do
  root to: 'pages#home'
  resources :sessions
  get 'login', to: 'sessions#new', as: 'login'
end
