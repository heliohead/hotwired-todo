Rails.application.routes.draw do
  root "pages#index"

  resources :users, only: :create
  resources :todos, only: [:create, :update]
end
