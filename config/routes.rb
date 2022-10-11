Rails.application.routes.draw do
  root "pages#index"

  resources :users, only: :create
end
