Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"

  namespace :admin do
    resources :categories, only: ['index']
    resources :images
  end

  resources :users, only: [:new, :create, :show] { resources :ideas }
  resources :images, only: [:index]

end
