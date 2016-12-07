Rails.application.routes.draw do
  resources :users
  resources :session, only: [:new, :create, :destroy]
  
  get    'login'  => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
end
