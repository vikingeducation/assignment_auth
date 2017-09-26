Rails.application.routes.draw do

  resources :users
  root 'users#index'

  resource :session, only: [:new, :create, :destroy]
  get "login" => 'sessions#new'
  delete "logout" => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
