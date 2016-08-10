Rails.application.routes.draw do
  resources :users
  resource :session, only: [:create, :destroy]
  get "login" => "sessions#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
