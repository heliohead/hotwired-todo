Rails.application.routes.draw do
  root "pages#index"

  resources :users, only: [:create, :index]
  resources :todos, only: [:create, :update]
end
