Rails.application.routes.draw do

  root 'users#index'

  resource :session, :only => [:new, :create, :destroy]
  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"

  resources :users
end
