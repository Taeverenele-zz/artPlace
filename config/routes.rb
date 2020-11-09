Rails.application.routes.draw do
  resources :artworks
  devise_for :users
  root 'pages#home'

  get 'dashboard', to: 'pages#dashboard'

  post "/orders/:id/buy", to: "orders#buy", as: "buy"
  get "/orders/:id/success", to: "orders#success", as: "success"
  get "/orders/:id/cancel", to: "orders#cancel", as: "cancel"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
