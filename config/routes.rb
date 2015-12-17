Rails.application.routes.draw do

  root "homes#index"
  resources :homes, only: [:index]

  resources :users

  resources :items do
    resources :images
    resources :reservations, only: [:create]
    post "/reservations/approve" => "reservations#approve"
    post "/reservations/cancel" => "reservations#cancel"
    post "/reservations/return" => "reservations#return"
  end

  resources :reservations, only: [:index]
  
  resources :listings, only: [:index, :show]
  post "/listings" => "listings#index"

  resources :categories

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

end
