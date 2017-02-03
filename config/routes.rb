Rails.application.routes.draw do
  resources :users
  resource :session, :only => [:new, :create, :destroy]
  get 'login' => "sessions#new"
  delete 'logout' => "sessions#destroy"

  get 'root_url' => "users#index"
end
