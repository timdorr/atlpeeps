ATLpeeps::Application.routes.draw do
  resources :users
  resource :settings

  # Omniauth
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/logout', to: 'sessions#destroy', via: [:get, :post]

  root "users#index"
end