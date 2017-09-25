Rails.application.routes.draw do
  resources :users

  resource :session, only: [:new, :create, :destroy]
  get "login", to: "session#new"
  delete "logout", to: "session#destroy"

  root to: "users#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
