Rails.application.routes.draw do
  root "welcome#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/dashboard", to: "admin#dashboard"

  resources :users, only: [:new, :create, :show] { resources :ideas }

  namespace :admin do
    resources :categories
    resources :images
    resources :users, only: [:index, :show]
    resources :ideas, only: [:index, :show]
  end
end
