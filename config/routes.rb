ATLpeeps::Application.routes.draw do
  resources :users

  get   '/profile', to: "users#edit"
  post  '/profile', to: "users#update"
  match '/accounts', to: "users#accounts", via: [:get, :post]

  # Omniauth
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/logout', to: 'sessions#destroy', via: [:get, :post]

  root "users#index"
end