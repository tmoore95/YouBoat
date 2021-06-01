Rails.application.routes.draw do
  devise_for :users
  root to: 'listings#index'
  resources :listings do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, except: [:new, :create]
  get "/users/:id", to: "pages#profile", as: "profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
