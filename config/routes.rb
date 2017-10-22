Rails.application.routes.draw do

  root :to => 'users#index'

  resources :users
  resource  :session, :only => [:new, :create, :destroy]
  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"
end

