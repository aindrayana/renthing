Rails.application.routes.draw do

  root "homes#index"
  resources :homes, only: [:index]

  resources :users

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

end
