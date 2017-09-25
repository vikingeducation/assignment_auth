Rails.application.routes.draw do
  resources :users

  resource :session, only: [:new, :create, :destroy]
  get "login", to: "sessions#new"
  delete "logout", to: "sessions#destroy"

  root to: "users#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
