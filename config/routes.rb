Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, :only => [:new, :create, :destroy]
  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"
end
