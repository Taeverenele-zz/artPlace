Rails.application.routes.draw do
  resources :artworks
  devise_for :users
  root 'pages#home'

  get 'dashboard', to: 'pages#dashboard'

  post "/artworks/:id/buy", to: "artworks#buy", as: "buy"
  get "/artworks/:id/success", to: "artworks#success", as: "success"
  get "/artworks/:id/cancel", to: "artworks#cancel", as: "cancel"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
