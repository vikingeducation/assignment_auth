Rails.application.routes.draw do
  resources :users
  resource  :session, :only => [:new, :create, :destroy]
  get "login" => "session#new"
  delete "logout" => "sessions#destroy"
end
