ATLpeeps::Application.routes.draw do
  resources :users do
    collection do
      get :admin
    end
    member do
      post :approve
    end
  end

  get   '/auth',     to: "sessions#index"
  get   '/profile',  to: "users#edit"
  post  '/profile',  to: "users#update"

  # Omniauth
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/deauth/:provider', to: 'sessions#remove', via: [:get, :post]
  match '/logout', to: 'sessions#destroy', via: [:get, :post]

  root "users#index"
end