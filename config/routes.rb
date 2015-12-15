Rails.application.routes.draw do

  root "homes#index"
  resources :homes, only: [:index]

  resources :users

  resources :items do
    resources :images
  end

  resources :listings, only: [:index, :show]
  post "/listings" => "listings#index"

  resources :categories

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

end
