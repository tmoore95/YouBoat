Rails.application.routes.draw do
  devise_for :users
  root to: 'listings#index'
  resources :listings do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, except: [:new, :create]
  get "/users/:id", to: "pages#profile", as: "profile"
  post "/users/:id", to: "pages#booking_approve"
end
