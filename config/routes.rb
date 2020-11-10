Rails.application.routes.draw do
  resources :artworks
  devise_for :users
  root 'pages#home'

  get 'dashboard', to: 'pages#dashboard'

  post "/sales/:id/buy", to: "sales#buy", as: "buy"
  get "/sales/:id/success", to: "sales#success", as: "success"
  get "/sales/:id/cancel", to: "sales#cancel", as: "cancel"
  get "/sales/:id/", to: "sales#show", as: "order"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
