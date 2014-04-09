ATLpeeps::Application.routes.draw do
  resources :users

  match '/profile', to: "settings#profile", via: [:get, :post]
  match '/accounts', to: "settings#accounts", via: [:get, :post]

  # Omniauth
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/logout', to: 'sessions#destroy', via: [:get, :post]

  root "users#index"
end