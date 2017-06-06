Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  get "/login" => "sessions#new"
  delete "/logout" => "sessions#destroy"
  
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
