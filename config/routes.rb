Rails.application.routes.draw do
  resources :users
  resource :session, :only => [:new, :create, :deestroy]
  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"
end
