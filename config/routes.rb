Rails.application.routes.draw do
  devise_for :users
  root to: 'listings#index'
  resources :listings do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, except: [:new, :create]
  get "/users/:id", to: "pages#profile", as: "profile"
<<<<<<< HEAD
  post "listings/:id", to: "reviews#create", as: "new_review"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
=======
  post "/users/:id", to: "pages#booking_approve"
  patch "/users/:id", to: "pages#booking_decline"
>>>>>>> a9a4d63689788a329f648fdf8b41cc01a3b744d7
end
