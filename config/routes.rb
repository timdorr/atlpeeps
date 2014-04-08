ATLpeeps::Application.routes.draw do
  resources :users

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  root "users#index"
end