Rails.application.routes.draw do
  devise_for :users
  root to: 'listings#index'
  resources :listings do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, except: [:new, :create]
  get "/users/:id", to: "pages#profile", as: "profile"
  post "listings/:id", to: "reviews#create", as: "new_review"
  post "/users/:id", to: "pages#booking_approve"
  patch "/users/:id", to: "pages#booking_decline"
end
